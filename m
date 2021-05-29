Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A5394E3C
	for <lists+openbmc@lfdr.de>; Sat, 29 May 2021 23:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsvWX3drJz2yYL
	for <lists+openbmc@lfdr.de>; Sun, 30 May 2021 07:16:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=nmhgStnP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=nmhgStnP; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsvWC38tFz2yQq
 for <openbmc@lists.ozlabs.org>; Sun, 30 May 2021 07:16:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DF13341312;
 Sat, 29 May 2021 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1622322992; x=1624137393; bh=Hu9OEhKMOCzd75Lt7uz1s4y2z
 wIoYm8VWaZqQnL0thk=; b=nmhgStnP6BFYA7mVUOPkb8dUTHgMlRN4i0a7OvYxX
 XpYqjl4jrAjptIe6kft1ZgdIJhm7K3S8Z0IEyHzHhA8Qxnj4d4SIiNhwYzm3Il/3
 ONuwU+CZEpOAlZsq2KKIOn+9MyDeVOsAtRF3aYchKadTYOeERZ5PJrvlF6OU3EWe
 V4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfadHcbD4iVU; Sun, 30 May 2021 00:16:32 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0345841209;
 Sun, 30 May 2021 00:16:31 +0300 (MSK)
Received: from [10.199.0.40] (10.199.0.40) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 30
 May 2021 00:16:31 +0300
Message-ID: <4d6fb9a7edd4a27be17aca804a189f92b15abd9a.camel@yadro.com>
Subject: Re: FruDevice/Entity Manager vs hwmon
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Sun, 30 May 2021 00:16:30 +0300
In-Reply-To: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
References: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.40]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi Mahesh,

You right that using EM+dbus-sensors you can dynamically add sensors
when they are detected. But it seems you have kind of misunderstanding
about FruDevice. Let me explain a bit: 

EM is kind of "configuration manager". Main function of EM is to listen
dbus and match appearing of some resources. In reaction of this matches
EM exposes to dbus some other resources with configuration which used
by other daemons. Additionally to this, EM can instantiate devices
(send new_device command to kernel driver).
EM itself can only detect dbus entities and there are "detection 
daemons" to tell EM that there is some hardware available. FruDevice is
one of this "detection  daemons" which scans I2C bus looking for
EEPROMs with IPMI FRU data. That is how you detect baseboard, PSUs and
units, but is you sensors don't have FRU, you need to implement other
detection mechanism.
Typically you have y sensors mounted on baseboard, so you need to
describe them in EM config, not in FruDevice.
Note that using EM doesn't exclude defining sensors in device tree -
you still can do this if you want.
For list of supported devices, that can be instantiated by EM, see
https://github.com/openbmc/entity-manager/blob/master/include/devices.hpp#L48


On Sat, 2021-05-29 at 19:13 +0000, Mahesh Kurapati wrote:
> Hello, 
>  
> I want to define temperature sensors, fans and PSUs for our new
> platform.  Going through the documentation and sources,  I understand
> that there are two approaches.  One is to define them with the same i2c
> path as mentioned in the device tree as part of the hwmon
> configuration, and the other approach is to define a json file with
> appropriate probe in the entity-manager/configurations folder so that
> the FruDevice and Entity Manager apps detect the devices as per the
> probe and create the matching dbus objects, while the dbus-sensors do
> the instrumentation.  With entity manager approach I understand that
> the i2c devices are created/probed when they are detected.  My
> questions is we don’t need the device defined in the device tree file
> if I go by this approach? I understand that this helps the dynamic
> detection of the FRU.  Also we have LM73, and other temp sensor TMP431c
> that is not defined in the FruDevice record map.  Next question is do I
> need to add support for the LM73 tmp75MP431C and other one in the
> FruDevice so that it gets created properly? Can I use any existing
> strings/mapping for these sensors?  This is not needed if I define the
> entries in the device tree, and integrate with hwmon I have everything
> needed.  I see that hwmon and FruDevice/Entity Manager/dbus-sensors
> provide similar functionality.  Can I have both of these services
> running at the same time on the BMC? Will it cause any conflicts?
>  Please help me understand.
>  
> Thank you, 
> Mahesh

-- 
Best regards,
Andrei Kartashev


