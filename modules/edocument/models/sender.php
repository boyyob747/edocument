<?php
/**
 * @filesource modules/edocument/models/sender.php
 * @link http://www.kotchasan.com/
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 */

namespace Edocument\Sender;

/**
 * โมเดลสำหรับขอข้อมูลผู้ส่ง
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Model extends \Kotchasan\Model
{
  private $datas = array();

  /**
   * อ่านรายชื่อหมวดหมู่จากฐานข้อมูลตามภาษาปัจจุบัน
   * สำหรับการแสดงผล
   *
   * @return \static
   */
  public static function init()
  {
    $model = new static;
    $sql1 = $model->db()->createQuery()
      ->select('sender_id')
      ->from('edocument');
    $query = $model->db()->createQuery()
      ->select('id', 'name')
      ->from('user U')
      ->where(array('id', 'IN', $sql1))
      ->order('U.name')
      ->toArray();
    // อ่านรายชื่อตำแหน่งจากฐานข้อมูล
    foreach ($query->execute() as $item) {
      $model->datas[$item['id']] = $item['name'];
    }
    return $model;
  }

  /**
   * ลิสต์รายชื่อผู้ส่ง
   * สำหรับใส่ลงใน select
   *
   * @return array
   */
  public function toSelect()
  {
    return $this->datas;
  }

  /**
   * อ่านชื่อสมาชิกที่ $id
   * ไม่พบ คืนค่าว่าง
   *
   * @param int $id
   * @return string
   */
  public function get($id)
  {
    return isset($this->datas[$id]) ? $this->datas[$id] : '';
  }
}
