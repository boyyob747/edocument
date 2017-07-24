<?php
/**
 * @filesource modules/edocument/controllers/write.php
 * @link http://www.kotchasan.com/
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 */

namespace Edocument\Write;

use \Kotchasan\Http\Request;
use \Gcms\Login;
use \Kotchasan\Html;
use \Kotchasan\Language;

/**
 * module=edocument-write
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Controller extends \Gcms\Controller
{

  /**
   * ฟอร์มสร้าง/แก้ไข เอกสาร
   *
   * @param Request $request
   * @return string
   */
  public function render(Request $request)
  {
    // ตรวจสอบรายการที่เลือก
    $index = \Edocument\Write\Model::get($request->request('id')->toInt());
    // ข้อความ title bar
    $title = '{LNG_'.(empty($index->id) ? 'Send Document' : 'Edit').'}';
    $this->title = Language::trans($title.' {LNG_E-Document}');
    // เลือกเมนู
    $this->menu = 'module';
    // สามารถจัดการรายชื่อบุคลากรได้
    if ($index && Login::checkPermission(Login::isMember(), 'can_upload_edocument')) {
      // แสดงผล
      $section = Html::create('section');
      // breadcrumbs
      $breadcrumbs = $section->add('div', array(
        'class' => 'breadcrumbs'
      ));
      $ul = $breadcrumbs->add('ul');
      $ul->appendChild('<li><span class="icon-edocument">{LNG_Module}</span></li>');
      $ul->appendChild('<li><a href="{BACKURL?module=edocument-sent}">{LNG_E-Document}</a></li>');
      $ul->appendChild('<li><span>'.$title.'</span></li>');
      $section->add('header', array(
        'innerHTML' => '<h2 class="icon-write">'.$this->title.'</h2>'
      ));
      // แสดงฟอร์ม
      $section->appendChild(createClass('Edocument\Write\View')->render($index));
      return $section->render();
    }
    // 404.html
    return \Index\Error\Controller::page404();
  }
}
