<?php

declare(strict_types=1);

namespace App\Model\GetInfo;

use Cake\Http\Client;
use App\Model\GetInfo\Weather;

class WeatherMain extends Weather {
// getApiData() を上書きする
    public function getApiData() {
        $http = new Client();

        $response = $http->get(
          $this->apiUrl . $this->loc . "&appid=" . $this->apiKey
        );
        
        $json = $response->getJson();
        
        return $json;
    }

}