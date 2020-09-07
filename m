Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADC25F59F
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 10:49:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlMR42wHfzDqJW
	for <lists+openbmc@lfdr.de>; Mon,  7 Sep 2020 18:49:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=gXIsWssE; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlMQF3ZvvzDqMp
 for <openbmc@lists.ozlabs.org>; Mon,  7 Sep 2020 18:48:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5BEA2574F6;
 Mon,  7 Sep 2020 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599468525; x=1601282926; bh=/1HbLJDvNoCP8KnWV4FeV7NKj
 +B5lwVTTqUUQddyTjY=; b=gXIsWssEGVKw7pSdy2FJ2sQAyEAuJBLC8vviC3rOt
 GtJvMdO4Nhmk0PMn2LlUSqLWWSWPwwd8VP2Pq1B33gnXg8aDRxwUDHnqFOScW3mL
 X8kCEAIUpa3pGDxdpR3CUECLzLbXyakW28+afJvX7bKj2U5LH/Ydvts+OiZgg/sf
 2Q=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1dHPBdAc-ku; Mon,  7 Sep 2020 11:48:45 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 434ED5625E;
 Mon,  7 Sep 2020 11:48:45 +0300 (MSK)
Received: from [10.199.2.182] (10.199.2.182) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 7 Sep
 2020 11:48:44 +0300
Message-ID: <ad11a66510115769d1bda99bc15bbd1a7a04117b.camel@yadro.com>
Subject: Re: What is the purpose of Phosphor Inventory Manager
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Brad Chou <bradc@hyvedesignsolutions.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 7 Sep 2020 11:48:43 +0300
In-Reply-To: <CY4PR04MB1033C04444A28A488631A5ABB9280@CY4PR04MB1033.namprd04.prod.outlook.com>
References: <CY4PR04MB1033C04444A28A488631A5ABB9280@CY4PR04MB1033.namprd04.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.2.182]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi, 

You right, if you already use EntityManager, you should not need
Phosphor Inventory Manager since EM aimed to replace PIM.

On Mon, 2020-09-07 at 03:37 +0000, Brad Chou wrote:
> Hi,
> I am doing some study of what Phosphor Inventory Manage does.
> After read the README.md and the examples directory, I think it does
> two things.
> Create/Delete/Update Object or Properties based on some other
> property changes.
> Create Associations between sensors and it’s belonging hardware.
>  
> There is no enough example to tell me when should I
> create/delete/update objects and properties based on other
> properties.
> Is it necessary ?
>  
> Also, when I use entity-manager with dbus-sensors to expose my
> sensors, I found the dbus-sensors create the associations of all
> sensors for me.
> I don’t need to write another YAML file in the Phosphor Inventory
> Manage to generate it.
> Does it mean I don’t need to use Phosphor Inventory Manage because
> dbus-sensors already doing the same thing ?
>  
> Thanks.

