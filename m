Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175526C346
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 15:30:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs1FH5NDRzDqGh
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 23:30:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=M6L5ObxJ; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs1BS2Y8ZzDqZk
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 23:28:15 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C94EE5704F;
 Wed, 16 Sep 2020 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:date:date:from:from:subject:subject
 :message-id:received:received:received; s=mta-01; t=1600262890;
 x=1602077291; bh=Fu1wToZcSbY3P9dvucVsKQr1dMOp2TSe405cw61ddn4=; b=
 M6L5ObxJOuPoHKJvRXOQ3nyon37rHe3ukO3WxkhOvHjQdKod2GMUEXGEuB3ya9w1
 OdjvZWqrb/36aExfYP5BJk/K9AwUSRX2KtgJMD6hmvqD4S/ogSayxMY73DVuHu9M
 9MtwPxyACtM+oec8gzA5M9C/cWvJDbNT/o9BJF/uoRU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Srp90l7y0FiO; Wed, 16 Sep 2020 16:28:10 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AAD6F574EB;
 Wed, 16 Sep 2020 16:28:10 +0300 (MSK)
Received: from [10.199.0.126] (10.199.0.126) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 16
 Sep 2020 16:28:10 +0300
Message-ID: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
Subject: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
From: Andrei Kartashev <a.kartashev@yadro.com>
To: James Feist <james.feist@linux.intel.com>, Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 16:28:09 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.126]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

We noticed that dbus-sensors doesn't fully implement
xyz.openbmc_project.Sensor.Value interface: there is no Unit property
for all the sensors, defined by dbus-sensors.
I believe it was intentionally, but I still wondering what was the
reason?
I noticed that in intel-ipmi-oem units are determined based on object
paths, but that looks ugly since there is well-defined natural
interface for units in dbus.
Lack of the "Unit" property in the interface breaks some existing
logic.

-- 
Best regards,
Andrei Kartashev


