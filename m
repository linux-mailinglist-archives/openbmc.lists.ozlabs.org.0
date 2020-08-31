Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB6258429
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:42:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgQFR56xQzDq9l
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:42:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=S9DZaVd8; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgCNr18dhzDqSv
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 00:33:09 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EA8EB5732F
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :subject:subject:from:from:received:received:received; s=mta-01;
 t=1598884382; x=1600698783; bh=mPbSyKEKLErmj8Xwh7UhCbJm81VVVq04
 jLZhwPAaI5k=; b=S9DZaVd8SNMjINE3xQB7kl7pqy4HKfNcah8MskFoOUhtcTQ1
 yiWN+24HNsLK0KTuba0ciiSFRoJG50QKA7FxiIzhE/fcTOivCGligtyXzTiHr2zG
 rPcJ6naDqyF0sILz9khcN4S6cL9qBcbEZKS9GG8amT0Otm3O0mDIiQ19Glk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfAjYf7gA5Td for <openbmc@lists.ozlabs.org>;
 Mon, 31 Aug 2020 17:33:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D5A7B527BA
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 17:33:02 +0300 (MSK)
Received: from [10.199.1.162] (10.199.1.162) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 31
 Aug 2020 17:33:02 +0300
To: <openbmc@lists.ozlabs.org>
From: i.kononenko <i.kononenko@yadro.com>
Subject: Naming DBus paths of CPU objects
Message-ID: <a8f0ad6f-fc7c-acbf-dab2-320e432366d8@yadro.com>
Date: Mon, 31 Aug 2020 17:33:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.1.162]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-Mailman-Approved-At: Tue, 01 Sep 2020 08:40:29 +1000
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

Hi Team,

I'm working on improving of the OpenBMC RedFISH API. In particular, the endpoint of the Processor.
To provide all the properties of the applied RedFISH schema, we need to get from 
DBus everything related to the CPU object.
It can be CPU, Sensor CPU temp, Sensors Core CPU, etc.

However, some services have different names for the same physical processor. 
In particular it is about `entity-manager`, `dbus-sensros`, `smbios-mdr_v2`.
`Smbios-mdr_v2` (just like `hwmon`) names the processor, indexing 
it from 0; in entity-manager dbus-sensor indexing starts from 1.

I want to add dbus-associations between all Processor's object, 
but for that I think we need to adopt a naming convention for the same DBus objects.

I like to index it from 0, just like doing that the `hwmon`, for example.

-- 
Best Regards!
Igor Kononenko
