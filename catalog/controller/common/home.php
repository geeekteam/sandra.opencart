<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

        // Категории
        $this->load->model('catalog/category');

        $data['categories'] = $this->model_catalog_category->getCategories(83);
        $data['filter_groups'] = $this->model_catalog_category->getCategoryFilters(83);
        $data['all_categories'] = array();

        foreach ($data['categories'] as $category):
            $data['all_categories'][] = array(
                'category_href' => $this->url->link('product/category', 'path=' . $category['category_id']),
                'category_name' => $category['name'],
                'sort_order' => $category['sort_order']
            );
        endforeach;
        //Конец категорий

		$this->response->setOutput($this->load->view('common/home', $data));


	}
}