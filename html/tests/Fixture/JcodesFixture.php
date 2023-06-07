<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * JcodesFixture
 */
class JcodesFixture extends TestFixture
{
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'id' => 1,
                'name' => 'Lorem ipsum dolor sit amet',
                'json' => '',
                'created' => '2023-06-07 12:15:18',
                'modified' => '2023-06-07 12:15:18',
            ],
        ];
        parent::init();
    }
}
