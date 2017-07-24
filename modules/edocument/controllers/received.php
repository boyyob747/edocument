<?php
/**
 * @filesource modules/edocument/controllers/received.php
 * @link http://www.kotchasan.com/
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 */

namespace Edocument\Received;

use \Kotchasan\Http\Request;
use \Gcms\Login;
use \Kotchasan\Html;
use \Kotchasan\Language;

/**
 * module=edocument-received
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Controller extends \Gcms\Controller
{

  /**
   * แสดงรายการเอกสาร
   *
   * @param Request $request
   * @return string
   */
  public function render(Request $request)
  {
    // ข้อความ title bar
    $this->title = Language::trans('{LNG_List of} {LNG_received document}');
    // เลือกเมนู
    $this->menu = 'module';
    // Login
    if ($login = Login::isMember()) {
      // แสดงผล
      $section = Html::create('section');
      // breadcrumbs
      $breadcrumbs = $section->add('div', array(
        'class' => 'breadcrumbs'
      ));
      $ul = $breadcrumbs->add('ul');
      $ul->appendChild('<li><span class="icon-edocument">{LNG_Module}</span></li>');
      $ul->appendChild('<li><span>{LNG_E-Document}</span></li>');
      $ul->appendChild('<li><span>{LNG_received document}</span></li>');
      $section->add('header', array(
        'innerHTML' => '<h2 class="icon-list">'.$this->title.'</h2>'
      ));
      // แสดงหนังสือรับ
      $section->appendChild(createClass('Edocument\Received\View')->render($request, $login));
      return $section->render();
    }
    // 404.html
    return \Index\Error\Controller::page404();
  }
}
