package com.nuritech.excs.kafka.sample.web;


import com.nuritech.excs.kafka.sample.service.KafkaProducer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Kafka와 연동하여 메세지를 주고 받는 샘플코드 입니다.
 * application.proeprties에 Producer와 Consumer 설정을 하고
 * KafkaProducer 서비스와 KafkaConsumer 서비스를 통해 Kafka와 메시지를 주고 받습니다.
 *
 * application.properties를 통해 설정을 함으로서 설정을 1개만 관리 할 수 있다.
 * 여러 개 설정을 관리하려면 Bean으로 구현해야 한다.
 *
 * 테스트 방법 : Postman을 통해 Http POST 방식으로 다음 URL Call
 * localhost:8080/kafka/test?message=Welcom to Kafka world!!
 */
@Slf4j
@RestController
@RequestMapping(value = "/kafka/test")
public class SampleController {
    private final KafkaProducer producer;

    @Autowired
    SampleController(KafkaProducer producer) {
        this.producer = producer;
    }

    @PostMapping
    public String sendMessage(@RequestParam("message") String message) {
        this.producer.sendMessage(message);

        return "success";
    }
}