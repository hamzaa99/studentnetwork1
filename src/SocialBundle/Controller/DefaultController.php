<?php

namespace SocialBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('SocialBundle:Default:index.html.twig');
    }
}
