Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9DC401994
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 12:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H34750JG5z2xvf
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 20:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=ubepSxtA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ubepSxtA; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H346g14JNz2xWm
 for <openbmc@lists.ozlabs.org>; Mon,  6 Sep 2021 20:15:54 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AED924CA86;
 Mon,  6 Sep 2021 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1630923348; x=1632737749; bh=eNAwOYwjThBOBHwNtK4BqbF0Z
 njF/8C69bpsIRK2UcE=; b=ubepSxtAn4vBdJTh6DUIqs0tQ/0lz9wlkDyh9h8nd
 Z6vuDSHewnymJYHO5fJljCcR5/S0MfMLo8XtMFOStsN0Gl5KF9oXuQHBjO/Tx8jd
 lhg0U34M5/EibVTrj7+12KfT5pERFrOUgnZNjoE/qoKzxCF0lg1wZKBeZ+Lp+ElO
 sA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eF3QQUpF6ji; Mon,  6 Sep 2021 13:15:48 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 183F546169;
 Mon,  6 Sep 2021 13:15:47 +0300 (MSK)
Received: from [10.199.0.39] (10.199.0.39) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 6 Sep
 2021 13:15:47 +0300
Message-ID: <6605257f36d729f8e4c57387209cb0df1b4a1ffd.camel@yadro.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E8=A6=86=3A?= [phosphor-host-ipmid]
 Questions about IPMI (OEM) command development
From: Andrei Kartashev <a.kartashev@yadro.com>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 6 Sep 2021 13:15:46 +0300
In-Reply-To: <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.39]
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

Hello,

I don't represent Intel, but have some considerations about this topic:
1) Try to not reuse intel-ipmi-oem. Much better solution would be to
create your own xxx-ipmi-oem package and implement only methods you
really need.
2) Better way would be to implement required logic in phosphor-host-
ipmid and submit changes there. I didn't investigate this yet since we
also pull intel-ipmi-oem to our project, but I believe, it should not
be too difficult. Don't repeat our mistakes ).
3) There is priority argument which you can use to determine handler
call order.
4) Most functions there are specific for Intel servers, so the useless
even is you use Intel CPUs but your own platform.
5) Use "journalctl -t ipmid -o pretty-json" or something like this. But
now it is recommended to use new syntax:
https://github.com/openbmc/phosphor-logging/blob/master/docs/structured-logging.md


On Mon, 2021-09-06 at 09:40 +0000, Chris Chen (TPI) wrote:
> Hi all,
> 
> I guess this mail was got overwhelmed by bunches of emails, so please
> let me resend it and hope someone could help me. Another, I add one
> more question marked #5 below.
> 
> Thank you.
> 
> Regards,
> Chris Chen
> 
> 寄件者: openbmc <openbmc-bounces+chris.chen3=flex.com@lists.ozlabs.org> 代表
> Chris Chen (TPI) <Chris.Chen3@flex.com>
> 寄件日期: 2021年9月2日 下午 06:34
> 收件者: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> 主旨: [phosphor-host-ipmid] Questions about IPMI (OEM) command
> development 
> Hi all,
> 
> I have studied "phosphor-host-ipmid" package for a couple of weeks and
> got understanding that it has implemented some mandatory and optional
> commands already. And I also knew that I'm able to leverage "intel-
> ipmi-oem" package to get more command handlers. But there're some
> questions raised in my mind, I hope someone could give me some
> suggestions.
>    1. What's the normal development procedure in case I want to make
> our own OEM commands? I mean do you guys encourage me to create a new
> "xxx-ipmi-oem" package or to leverage "intel-ipmi-oem" and then add our
> own commands in it?
>    2. I for now added "intel-ipmi-oem" package only for using its
> "<Chassis>:<Set Front Panel Enables>" command because I figured out the
> same command in the "phosphor-host-ipmid" is not able to match the d-
> bus interface in the "x86-power-control". I'm not sure if I will need
> other commands in the "intel-ipmi-oem", but what if I don't need other
> commands, how to remove them? to use the whitelist mechanism?
>    3. Is it okay to add more than 1 xxx-ipmi-ome packages? If yes, how
> to manage the whitelist between these 2 OEM packages?
>    4. Am I able to use "intel-ipmi-oem" on a platform that is using AMD
> CPU?
>    5. How to print the "entry("SENDER=%s", sender.c_str())" parts? I
> mean I for now can print out "Set up ipmi context" string after
> following the instruction listed in
> "https://github.com/openbmc/openbmc/wiki/Debugging-OpenBMC#enabling-application-debug
> ", but I don't see "SENDER=" when I executed "journalctl -t ipmid"
> command.
>    6.    1. log<level::DEBUG>("Set up ipmi
> context",entry("SENDER=%s",sender.c_str()),                     
> entry("NETFN=0x%X", netFn),entry("LUN=0x%X", lun),                     
> entry("CMD=0x%X", cmd),entry("CHANNEL=%u", channel),                   
>   entry("USERID=%u", userId),                     
> entry("SESSIONID=0x%X", sessionId),                     
> entry("PRIVILEGE=%u",static_cast<uint8_t>(privilege)),                 
>     entry("RQSA=%x", rqSA));
> Thank you.
> 
> Regards,
> Chris Chen
> Legal Disclaimer :
> The information contained in this message may be privileged and
> confidential. 
> It is intended to be read only by the individual or entity to whom it
> is addressed
> or by their designee. If the reader of this message is not the intended
> recipient,
> is strictly prohibited. If you have received this message in error, 
> please immediately notify the sender and delete or destroy any copy of
> this message!

-- 
Best regards,
Andrei Kartashev


