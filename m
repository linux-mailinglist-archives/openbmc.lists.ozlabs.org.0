Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E943EABCC
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 22:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Glyz950S8z30KN
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 06:32:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=TR2h7YAk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=TR2h7YAk; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Glyyk2gV7z30Gs
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 06:31:42 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2BEEC49DDE;
 Thu, 12 Aug 2021 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1628800296; x=1630614697; bh=Tuc
 BvqzSKPcgSF4TsrufAYGh2Vj0XGfEq1mKcdZ73H8=; b=TR2h7YAkx61u/Kh5PoV
 Y4g04oY9RQwU9QGVNLDoO01ra+7t8M+entphRUTTfbnKHtimWT9UsFyJ9ZUhkgiP
 quV1p43NjCnm/qbWaiXgW+tQHM7kg7zd7HRMcan1NEcDnuGO+89tW6DWvwHfLtW0
 okFmYghOqIBYUCkpbTZDbFZo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rtTQTSy-r0_w; Thu, 12 Aug 2021 23:31:36 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C93FA49720;
 Thu, 12 Aug 2021 23:31:33 +0300 (MSK)
Received: from [10.199.0.11] (10.199.0.11) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 12
 Aug 2021 23:31:32 +0300
Subject: Re: Turning off the D-Bus REST API by default
To: Ali Ahmed <ama213000@gmail.com>, <openbmc@lists.ozlabs.org>
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <95593cd9-a394-1388-d227-f54f05c6b2ba@yadro.com>
Date: Thu, 12 Aug 2021 23:31:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.11]
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

Ali,

On 12.08.2021 17:10, Ali Ahmed wrote:

> After this commit to use phosphor-webui or D-Bus REST, you will need
> to set -Drest=enabled in your bbappend. Note: webui-vue uses Redfish
> and will not be impacted. Let me know if you have any concerns.

As far I knew, the webui-vue uses REST API to retrieve the TPM status.
Please, look to the link below [1]

Links: 
[1]  https://github.com/openbmc/webui-vue/blob/6dba4be6125c10210bafa030ac17737d3a9b28b8/src/store/modules/Operations/BootSettingsStore.js#L73 
> 
> -Ali Ahmed
> 

-- 
Best regards,

Igor Kononenko
