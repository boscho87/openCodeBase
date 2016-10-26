<?php
/**
 * Created by PhpStorm.
 * User: simon.mueller
 * Date: 19.10.2016
 * Time: 13:32
 */

namespace H2gAsApiTest;




use H2gAsApi\Service\CURLHandler;
use PHPUnit_Framework_TestCase;

class CurlHandlerTest extends PHPUnit_Framework_TestCase
{

    public function testObjectCanBeCreated()
    {
        $curl = new CURLHandler();
        $this->assertInstanceOf(CURLHandler::class, $curl);
    }



    public function testcanFetchDataFromAPI()
    {
        //Todo Test to a Faster API :-)
        //Whitout request uri
        $curl = new CURLHandler();
        $curl->setBaseURL("https://teamtreehouse.com/simonmller.json");
        $data = $curl->getData();
        $jsonData = json_decode($data);
        $this->assertEquals("simonmller", $jsonData->{'profile_name'});

        //With Reqeust URI  with two Slashes
        $curl = new CURLHandler();
        $curl->setBaseURL("https://teamtreehouse.com/");
        $curl->setRequestUri("/simonmller.json");
        $jsonData = json_decode($data);
        $this->assertEquals("simonmller", $jsonData->{'profile_name'});

        //Changed Reqeust URI whit one slash
        $curl->setRequestUri("samuel.json");
        $data = $curl->getData();
        $jsonData = json_decode($data);
        $this->assertEquals("samuel", $jsonData->{'profile_name'});
    }

}
