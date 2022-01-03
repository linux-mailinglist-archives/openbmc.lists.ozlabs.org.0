Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F848357B
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 18:20:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSMw45txXz2yxP
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 04:20:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zzmYPKzb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=zzmYPKzb; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSMvd3XHJz2xDY
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jan 2022 04:20:27 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id v15so56996839ljc.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jan 2022 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B44Hz8HoygANkrQKSjln/jkqh99fcgNOzAdwatiSrpM=;
 b=zzmYPKzbRCJzwbC4x2Qwli3P2QIudp9EX6Wy7YqPXH7rSUG7icteUvoL2ZBIoh+teh
 a2GF61BBq9y3s0Wp4dvkR6nWlitmLoWx5cFqbTNaZcE5V0sNUgmNuwevpN4F1vvKynEC
 SSRQluBhyf9t8wY5yFhkyz0Ib9TXIEiTZsuCrIbSMN+W/kL2gG6KYf+Qt1l5UGWJdqQK
 JGnO++Dr4zgpME+13b1jc6i/PFjGC6ESdP3fn2dgBj4NsUvtC4d/UEZRsCQR8dLfMTe1
 cHVm1A3zuC/FuM7hJHiEMZIEmVHzYP/qc9kjwhQJqRM8InuuWIPNFaz4qKkPKptR8IXR
 pd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B44Hz8HoygANkrQKSjln/jkqh99fcgNOzAdwatiSrpM=;
 b=J01SeQ5YkauBidsLYiT+oU0uJ5JOlbdbVqBLlC0XqN6OZHD6xaUoLayQCEc5AWT+9B
 OdGhR0o/alue/sEVD4FY+Ac9UK5BDMGXYzD8/AxNssJn0RZmObSmpBFM2sictLnJsfMr
 Pyn31BkoyWmc3m09e0A6efpbn+vRbEfyUkrRawo7y72GrRa4iub2gUotShe3TJA6d1as
 Go21r59h0A0D7rYljsgjan5Ugok/CsHYcVmUAhQUfQeZG/QVekriDXI24ro83FbJrTF4
 U5v97fDZ+HjKpYjrF6f/PhktIkc8aZn+6MK94AFG2WWVJabjH7Wh7jgV0YJ6UQSbABnN
 e/PA==
X-Gm-Message-State: AOAM5314eJl1DbgsStIe27es7SssLQhZS65p9DzfvNj3RgU2zHxmqO3A
 iiQmDUkr0qn4a+5aqYQ1BzLvq34ms8Y/J0klUtVbfg==
X-Google-Smtp-Source: ABdhPJyLS+sDA4nAf8twwCq0rTLMudpqslNGc7jIulQr+n+RxdfA5sYLphsTcLJFkmiOzivEK6LesFwOcw2mrc3ZyAY=
X-Received: by 2002:a2e:83d0:: with SMTP id s16mr36374328ljh.360.1641230420719; 
 Mon, 03 Jan 2022 09:20:20 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
 <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
 <CAH2-KxDeAixLTj0MH2H+PH0P8NJv2Jf03VCdyxta17jLNuEnHw@mail.gmail.com>
 <4c4d2c0a-8840-4562-8e79-304f32a11904@linux.vnet.ibm.com>
In-Reply-To: <4c4d2c0a-8840-4562-8e79-304f32a11904@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 3 Jan 2022 09:20:10 -0800
Message-ID: <CACWQX80hcLXJrvXmg45v6L89_Ks__qc5MqUETGyvKeaqxzqY-w@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
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
Cc: Jayashree D <jayashree-d@hcl.com>, Ed Tanous <edtanous@google.com>,
 velumanit@hcl.com, Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 31, 2021 at 9:31 AM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> On 12/20/2021 10:29, Ed Tanous wrote:
> > On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
> > <kumarthangavel.hcl@gmail.com> wrote:
> >>
> >> Hi All,
> >>
> >> Gentle Reminder on this.
> >>
> >> Thanks,
> >> Kumar.
> >>
> >> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <kumarthangavel.hcl@gmail.com> wrote:
> >>>
> >>> Hi All,
> >>>
> >>>
> >>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.
> >>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab
> >
> > Bruce, this is your patch.  Could you take a look at the below and
> > provide your input?
> >
> >>>
> >>>
> >>> While testing those changes in my platform, I found that each sensor in hwmon temp has been creating twice.
> >>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is created twice.
> >>>
> >>>
> >>> /sys/class/hwmon/hwmon2/temp2_input
> >>> /sys/class/hwmon/hwmon2/temp1_input
> >>>
> >>>
> >>> Before your change, hwmon temp sensor will check whether the path is already exists or not.
> >>> If it exists, it will skip and proceed with next path.
> >>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96
> >>>
> >>>
> >>> Could you please explain why it is creating twice in hwmon temp ?
> >>>
> >>>
> >>> Journalctl log before your changes applied :
> >>>
> >>>
> >>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hwmon/hwmon2/temp2_input"
> >>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : xyz.openbmc_project.Configuration.TMP421
> >>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
> >>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hwmon/hwmon2/temp1_input"
> >>>
> >>>
> >>>
> >>> Journalctl log after your changes applied :
> >>>
> >>>
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hwmon/hwmon2/temp2_input"
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>
> >>>
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hwmon/hwmon2/temp1_input"
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
> >>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
> >>>
> >>>
> >>>
> >>> Thanks,
> >>>
> >>> Kumar.
>
> I will give it quick look today.  Also today is my last day at IBM.
>

Do you plan on continuing this beyond your tenure at IBM?  If not, is
someone taking this feature over for you?  Given it's been a few weeks
since this regression was reported, and I don't see any fixes in
review, I'm leaning toward reverting it on master for the time being
until someone puts up a patch to fix the issue.
