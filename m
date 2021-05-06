Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 054923751D2
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 11:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbTMq0MQjz304h
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 19:50:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=VHW0L/Z6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=VHW0L/Z6; dkim-atps=neutral
X-Greylist: delayed 579 seconds by postgrey-1.36 at boromir;
 Thu, 06 May 2021 19:49:53 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbTMP1z0Rz300c
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 19:49:53 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id ABB4D4120D;
 Thu,  6 May 2021 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1620294008; x=1622108409; bh=s2pWtrni67szU3lxCSqYI8kbL
 na0gOUGfiebdsmAQfc=; b=VHW0L/Z6L0huc6XdbUvzsUUXxE25jDrIfYeFTS5QF
 wEALGshq1qFOT4r0ZF8/iRO22igMNLCc+dLRrHx8Il6vr5EBAmvgDpbdvfgQqH6o
 r8usfoR2XQcOhyxXwOWCN5udGmFO75k8eDRHBPNuraTTPc1LH69KUxgah4aO77+3
 vs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocK7KklhMJhJ; Thu,  6 May 2021 12:40:08 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 498E84120B;
 Thu,  6 May 2021 12:40:08 +0300 (MSK)
Received: from [10.199.0.38] (10.199.0.38) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 6 May
 2021 12:40:07 +0300
Message-ID: <f5eedf23bfea01b5d69b43f4d35970f45f5d4e99.camel@yadro.com>
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Thu Nguyen OS <thu@os.amperecomputing.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 6 May 2021 12:40:01 +0300
In-Reply-To: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.38]
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

Hello,

I guess, when using dbus-sensors, you supposed to use phosphor-pid-
control package to control fans.

On Thu, 2021-05-06 at 09:22 +0000, Thu Nguyen OS wrote:
> Hi,
>  
> I’m supporting the fan control algorithms using phosphor-fan.
> Phosphor-fan monitoring and controlling require interface
> xyz.openbmc_project.Control.FanPwm in the fan inventory object.
> https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
>  
> But FanSensor daemon of dbus-sensor only adds
> /xyz/openbmc_project/sensors/fan_tach to inventory list, and this
> path don’t support xyz.openbmc_project.Control.FanPwm interface.
>  
> Do you have any solution to make phosphor-fan work with dbus-sensor?
>  
> I’m currently update FanSensor in dbus-sensor to add
> xyz.openbmc_project.Control.FanPwm to
> /xyz/openbmc_project/sensors/fan_tach.
>  
> Regards.
> Thu Nguyen.

-- 
Best regards,
Andrei Kartashev


