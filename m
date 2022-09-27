Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC65EBEDE
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 11:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McF8c4rQKz3c41
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 19:44:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YHI8pKkM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YHI8pKkM;
	dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McF8B0gtjz2yfq
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 19:44:23 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id j16so14889444lfg.1
        for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=PRh7WEW8KTWsCVaZJ9mlxbRcAjUbvGzVW+/F07utfaM=;
        b=YHI8pKkM69ZfeyqCHwfCT8G3QmlqC923EIfCQtxoop8h+L82iHpa5LaXHcywqr7dKd
         Puql3qKy1b2tCm8FjbMUMONg7quksy3pg2fNpycYxnwua469iHq1lfyjInqj7UcrtICU
         MwcjV0lyBslEpg/PUgTqhzomETJ35XJH4ZjoiXfEVpvq0jzZs4JOU/ICm7gsmBtsk54b
         HHadDNFExccK4hOUqmSiC9YYRH/JqL6TLaKEQOzzwHFWtNIHUymkpTwZfSkztKo94AxW
         ly3Ee8aBZPbiqA15k1HUGMM8GPpzXzKrBaWcnZwBXUNg62QhNS6wooScTysFsKc6tuf9
         c57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=PRh7WEW8KTWsCVaZJ9mlxbRcAjUbvGzVW+/F07utfaM=;
        b=Seyhp3fbeNsU1ZHgxivhsHF45SrqrATTtKajgFArz11G8BYoqcztX1J1+0q29mIMb7
         RC+mrbUxwGynBxrnk2dwffViScGid6ern1FrdCWW8cUBzZCBcbqoBm5pEnGomJxeHxLn
         rNDkrMeLz/isqRLFtdtMou3NU2LkIeurK0NN+3+KXsGce76Jtr1oTCChJNgq/A2HyEYv
         bMHhjaGjmDg9/VlrPl97WAudDt39TIGxVp3/5OOKPfzv/3R4UHAqVSP+t6qW1vaoHDhm
         iI1u3RTqteyBqYBRUij34fh3wzT2JkYiiyROV+PvjmkMcV+koXaSkkx5Mwcjfe9i6mg6
         CSaQ==
X-Gm-Message-State: ACrzQf3tawOlZvuk7LrT5dX57XdmfL9eMWzCK+1JxG52JlJUEn4RwWxJ
	W2vW+A4qy0iM8OhJOvlogDT+zMWlvqhVSexTtC5ve2iYT8I=
X-Google-Smtp-Source: AMsMyM6ZmExN67jb5fl+LBUebuXOlvGwnl9VkxDsRj/Jvn+4g9Rxn1mq7AGKZZUit95y7voK94mH9DwIJJMZRYZRDgQ=
X-Received: by 2002:a05:6512:2396:b0:499:159d:ac6a with SMTP id
 c22-20020a056512239600b00499159dac6amr9985357lfv.185.1664271854931; Tue, 27
 Sep 2022 02:44:14 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Tue, 27 Sep 2022 17:44:03 +0800
Message-ID: <CANFuQ7BJBX2dZyrYAvxfuZ2sjnWLR-iAbu6_iCQHBFg7--0X-A@mail.gmail.com>
Subject: Enhanced sensor monitor
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, all:
  I am working at Inspur and we're investigating a feature related to
sensor monitoring.

  As far as I know, the OpenBMC community will only trigger LED alarms
when the parsing FRU/VPD fails or is not in place. The lack of the
function of triggering the corresponding Sensor fault light for the
fault status (Warning/Critical) of the sensors, including
threshold-type sensors and discrete-type sensors.

  For threshold-type sensors, this function has been implemented in
the Intel warehouse [1], I think this should be a general function,
and even many companies have implemented it downstream, so can we push
this function upstream?
  For discrete-type sensors, it is only implemented in the
sensor.yaml[2] of the phosphor-ipmi-hostd, and we found that the
present state is simply implemented. I think it is necessary for us to
improve the discrete function and support all types and offsets.

  In addition: For the SEL function, the phosphor-sel-logger has
implemented threshold-type sensor alarms and records SEL, and I hope
to also integrate discrete-type functions, and be able to get all
sensor information through `ipmitool sel elist`.

  So we currently have an idea, we hope to create a
phosphor-sensor-monitor repository and implement the following
functions:
  1. Provide a PDI interface (eg:
xyz.openbmc_project.Discrete.Sensor.Value) to record discrete states
  2. Provide a way to monitor threshold sensor status -> trigger LED
-> log SEL (the function of logging SEL has been implemented in
phosphor-sel-logger, I hope the two repositories can be merged in the
future)
  3. Provide a way to monitor discrete sensor status
      a. If it is the data on the Host side, trigger the PDI interface
through the ipmiStorageAddSEL method of phosphor-host-ipmid -> trigger
LED -> record SEL
      b. If it is the data on the BMC side (eg: PSU, OCC, etc.), it
should inherit this PDI interface in the respective daemon, and the
phosphor-sensor-monitor only needs to monitor the property value of
the PDI interface -> trigger LED -> record SEL
  4. Flexible JSON configuration file, ideally, when adding or
deleting sensors, you do not need to change the code, just update the
JSON

  There may be many situations here that we have not considered.
Welcome to ask questions. If the current proposal is accepted, I will
push a design document, thanks!

[1]: https://github.com/Intel-BMC/provingground/tree/master/callback-manager
[2]: https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-example.yaml

BRs
George Liu
