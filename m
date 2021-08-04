Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E673DF991
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 04:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfZwr4DD9z3bVw
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 12:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=vG556DFS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=vG556DFS; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfZwX4T0vz2xvM
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 12:11:08 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 9970A467A9;
 Wed,  4 Aug 2021 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1628043060; x=1629857461; bh=dBy
 bzKUl7XARphqU7hfxxsvAQjvmsSs2+0svyyyNiCI=; b=vG556DFSHJ75ALnBnXx
 dOHomj7+nRP9u0UcONUwH53K3GuYfJMHcPWwbQE1S0CWE7uLSUL3ZvAxle+gTLzi
 wqo94+thqPD3rtgz3F/UVWOTnt79lCxmM9nm2s4KZWFjN5NktOSRX/ZGUmYvhhYa
 upaeAOb78cZ4LFbWhti4CEVk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VWz6HfbA1rt; Wed,  4 Aug 2021 05:11:00 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C57B14679F;
 Wed,  4 Aug 2021 05:10:59 +0300 (MSK)
Received: from [10.199.0.33] (10.199.0.33) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 4 Aug
 2021 05:10:58 +0300
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
To: Troy Lee <troy_lee@aspeedtech.com>, Konstantin Klubnichkin
 <kitsok@yandex-team.ru>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <6631628004052@mail.yandex-team.ru>
 <4354431a-0db6-fb9f-bc21-5ef34eba8852@yadro.com>
 <HK0PR06MB214515C746802AB15880B80F8AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <835cf3cc-c91a-3194-0f87-52ae197c3949@yadro.com>
Date: Wed, 4 Aug 2021 05:10:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <HK0PR06MB214515C746802AB15880B80F8AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.33]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Troy,

On 04.08.2021 04:50, Troy Lee wrote:
> Hi Igor,
> 
> Currently, the remote virtual media emulate the gadget driver as usb thumb drive instead of cd-rom.
> Please have a look on my patch:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42986
Please note, the phosphor-misc:usb-ctrl have a way to specify mode usb|usb-ro|hdd|dvd which is useful
to pick between both usb or cd-rom devices. Please, refer to the changes [1].

The implementation of usb-gadget:mass-storage has a many limitations about cd-rom: 
 * Image size should not be significant then 2.1Gb,
 * Supports only CD-ROM profile
That does following to failure of installing Windows-like OS, because without a number of DVD-ROM 
profile's features and correct SCSI-command handling(TOC/ATIP/PMA) a Windows OS can't load appropriate 
UDF-driver(iso-13346) and will stucks.

Summary the mentioned in the current subject patchset should solve the described issue.

> 
> Thanks,
> Troy Lee

Links:
* https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-misc/+/36499


-- 
Best regards,

Igor Kononenko
