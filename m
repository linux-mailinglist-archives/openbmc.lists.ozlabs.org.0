Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD3406B31
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 14:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5ZSy6wqgz2yTr
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 22:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=LB7KMoiv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=LB7KMoiv; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5ZSW6SDHz2yLk
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 22:10:03 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D00284CF61;
 Fri, 10 Sep 2021 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:user-agent:date:date:mime-version
 :content-type:content-type:organization:references:in-reply-to
 :from:from:subject:subject:message-id:received:received
 :received; s=mta-01; t=1631275796; x=1633090197; bh=W1hZq0ePMG2/
 Oj+PapVA2PGwDdhIFBGBX+2dnuSoRTk=; b=LB7KMoivGN8x2qtiR+LaQYGvosNP
 FWvlXNjJ3SrhUqcQwSeAbXm9gc1PrR0I+xwTLwLyeCB20EGqUOcdFhU+IJgQbXR7
 pKoB8IVq8AqiVDLHVZK9gz85mzWjOiD7VfxqUsLjGx25kEdwHJ+27a4nlQQWmNWM
 zPO6tVmzgAlEDSs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76nroQoTYHaq; Fri, 10 Sep 2021 15:09:56 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E60E34CF60;
 Fri, 10 Sep 2021 15:09:56 +0300 (MSK)
Received: from [10.199.0.180] (10.199.0.180) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 10
 Sep 2021 15:09:56 +0300
Message-ID: <435cf6e388bf47385ba0c35c48a225beb3450262.camel@yadro.com>
Subject: Re: How I can read fru information about cpu and dimm ?
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Alexander Raih <61a91bc@gmail.com>, <openbmc@lists.ozlabs.org>
In-Reply-To: <CAMqwjCDjaGDyRutmoqBM1zDK10VOWzkY82vQ6atUhqv1AsWa9g@mail.gmail.com>
References: <CAMqwjCDjaGDyRutmoqBM1zDK10VOWzkY82vQ6atUhqv1AsWa9g@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Fri, 10 Sep 2021 15:09:42 +0300
User-Agent: Evolution 3.40.1 
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.180]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Hello Alexander,

We can't tell you how to work with your hardware without any knowledge
about it's design.

Typically, CPU have no any EEPROM to read information from it. DIMMs
have special I2C channel, called SPD, but generally it is not connected
to BMC. I guess, you need to use some communication with the host to
request this information. But all this is common suggestion, you need
to know your hardware.

On Fri, 2021-09-10 at 13:10 +0300, Alexander Raih wrote:
> Hi guys, I am beginner in openbmc, cat you tell me a question.
> In device tree I describe eeprom on i2c bus. I read this eeprom file
> in fs and this file contained information only about
> mainboard(vendor,model,s/n,p/n).  Please tell me how can I get fru
> information about cpu, dimms ??
> 
> p.s. On another i2c bus I have 2 devices with addresses 0x70 0x71. I
> think that it is mux pca9545 and on the one on channel of this mux
> locate eeprom. 
> 

-- 
Best regards,
Andrei Kartashev


