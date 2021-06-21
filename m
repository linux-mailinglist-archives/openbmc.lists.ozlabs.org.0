Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89F3AE433
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 09:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7h2m3Ywcz308h
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 17:28:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uPeBN3Vc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=ojayanth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uPeBN3Vc; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7h2V4s9dz2y6B
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 17:28:00 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id p7so28358307lfg.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pqtv7NiO+rxVujyvn8y1MBzTEtSKlOglYbgEXYRjHwM=;
 b=uPeBN3VcwE3ybUqIJ+xLC5EHb5soz0IS9E9Owx3Ob0+zCbPmLhJ/mLxRgezUgbNuax
 c95gBkBpDn8G0p1bSegiXMdKCJ0CbVNEV9IKOUxjoPTv1sW7ff/gdD2oz2irDbg3uacg
 F3DmrUz8EjkXOaUtmzd9Jn9pdDYiIYBX0rIrFQD6HpD8SIWzwoutelNFBOS+FyycQ+xn
 SmHt4LlU9WhxKfHzfoANlyD45E3Ew9NGbXhMn/dqt3fFocDs3QCZevBBCZ9WEP0CJtrL
 N8tcV2Aj37l53cubE+ykvJRLhjwZfzSRIlqaDFz8R2wcCL6+YpfvFIkZ9QwQ0zFbrzG1
 1rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pqtv7NiO+rxVujyvn8y1MBzTEtSKlOglYbgEXYRjHwM=;
 b=QTyUiJyimanyFHZq8GFWS36Ne1Q/Tv31y9VVVLEq+lUMcX7AO4O9wGZCAAtTYhbA6M
 l7fbJ7bmWvL7w78Mntq4OEpJh8Y8z1RMTgWWtH1ytOPeC/rmVFfZ4NYkKGzROnbOZkxI
 JW5kbBktIhHSivrvN0z7AZ+j4TLkEUmIiJO2cQpnnDjGAu98tFcEOE9g8JxFXGpGT20x
 5OtS+45wj+WhBtyTTCsxOrcz8PBHdZivWXHObEA2VInc10UAx4SGdakmfcP102CSXBxP
 8x2U3o4Bb2XPx5kQNT6sHP0buhOokolE2SxbBBtzG8dh6Xm15AkOSBZvM3lzIn2d+jG0
 oV7Q==
X-Gm-Message-State: AOAM533FX84KOnQJDwOid5Grn7RpNoqls1c3n3FDnyFwCH/lqrA80K7K
 EE65sWb4wfCBWLUBMPF5FHtVzdXgbgcRj/5vhU4=
X-Google-Smtp-Source: ABdhPJzj7Zs0K4T6oRWrR6BT6hqi6bUIeR5hEGFXbRBaq/yoLUTXNLOZ1+j9I3D1BWXZVTRuQnoGDDYBIWY9UL5Rk3U=
X-Received: by 2002:a05:6512:358a:: with SMTP id
 m10mr13236591lfr.31.1624260473618; 
 Mon, 21 Jun 2021 00:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR17MB4593CE5FBD4D52B203364917960E9@SA1PR17MB4593.namprd17.prod.outlook.com>
In-Reply-To: <SA1PR17MB4593CE5FBD4D52B203364917960E9@SA1PR17MB4593.namprd17.prod.outlook.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Mon, 21 Jun 2021 12:57:42 +0530
Message-ID: <CACkAXSqu1RnUt54ueyF=N_Es4uxYJB-7kaSwVqhSzFnzR95rsQ@mail.gmail.com>
Subject: Re: phosphor-debug-collector
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Content-Type: multipart/alternative; boundary="0000000000008d82f305c5419ca5"
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

--0000000000008d82f305c5419ca5
Content-Type: text/plain; charset="UTF-8"

Design Document link :
https://github.com/openbmc/docs/blob/master/designs/dump-manager.md

BMC Dump Redfish interface details . I will get this updated in Readme .

Create bmc Dump
curl -k -H "X-Auth-Token: $bmc_token" -X POST
https://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/Actions/LogService.CollectDiagnosticData
-d '{"DiagnosticDataType":"Manager"}'Get BMC dump entries
curl -k -H "X-Auth-Token: $bmc_token" -X GET
https://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/EntriesDelete
all BMC dumps
curl -k -H "X-Auth-Token: $bmc_token" -X POST
https://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/Actions/LogService.ClearLogGet
particular BMC dump details
curl -k -H "X-Auth-Token: $bmc_token" -X DELETE
https://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/Entries/<dump-id>Download
BMC dump
curl -k -H "X-Auth-Token: $bmc_token" -X GET
https://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/attachment/<dump-id>
 > BMC_dump.tar.gzGet BMC dump Progress
curl -k -H "X-Auth-Token: $bmc_token" -X GET
https://${BMC_IP}/redfish/v1/TaskService/Tasks/<task_ID>


On Fri, Jun 18, 2021 at 1:32 AM Mahesh Kurapati <
mahesh.kurapati@keysight.com> wrote:

> Hello,
>
>
>
> How to use the services of phosphor-debug-collector? Readme says it can
> help retrieve the debug data for debugging.  How to collect this
> data/trigger the log collection?
>
>
>
> Thank you,
> Mahesh
>

--0000000000008d82f305c5419ca5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Design Document link : <a href=3D"https://github.com/=
openbmc/docs/blob/master/designs/dump-manager.md">https://github.com/openbm=
c/docs/blob/master/designs/dump-manager.md</a></div><div><br></div><div>BMC=
 Dump Redfish interface details . I will get this updated in Readme . <br><=
/div><div><pre class=3D"gmail-c-mrkdwn__pre" style=3D"box-sizing:inherit;ma=
rgin:4px 0px;padding:8px;font-size:12px;line-height:1.50001;font-variant-li=
gatures:none;white-space:pre-wrap;word-break:normal;font-family:Monaco,Menl=
o,Consolas,&quot;Courier New&quot;,monospace;border-radius:4px;color:rgb(29=
,28,29);font-style:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:left;text-indent:0px;text-transform:none;word-spac=
ing:0px;text-decoration-style:initial;text-decoration-color:initial">Create=
 bmc Dump<br style=3D"box-sizing:inherit">curl -k -H &quot;X-Auth-Token: $b=
mc_token&quot; -X POST https://${BMC_IP}/redfish/v1/Managers/bmc/LogService=
s/Dump/Actions/LogService.CollectDiagnosticData -d &#39;{&quot;DiagnosticDa=
taType&quot;:&quot;Manager&quot;}&#39;<span class=3D"gmail-c-mrkdwn__br" st=
yle=3D"box-sizing:inherit;display:block;height:unset"></span>Get BMC dump e=
ntries<br style=3D"box-sizing:inherit">curl -k -H &quot;X-Auth-Token: $bmc_=
token&quot; -X GET https://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Du=
mp/Entries<span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;di=
splay:block;height:unset"></span>Delete all BMC dumps<br style=3D"box-sizin=
g:inherit">curl -k -H &quot;X-Auth-Token: $bmc_token&quot; -X POST https://=
${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/Actions/LogService.Clear=
Log<span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:b=
lock;height:unset"></span>Get particular BMC dump details<br style=3D"box-s=
izing:inherit">curl -k -H &quot;X-Auth-Token: $bmc_token&quot; -X DELETE ht=
tps://${BMC_IP}/redfish/v1/Managers/bmc/LogServices/Dump/Entries/&lt;dump-i=
d&gt;<span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display=
:block;height:unset"></span>Download BMC dump <br style=3D"box-sizing:inher=
it">curl -k -H &quot;X-Auth-Token: $bmc_token&quot; -X GET https://${BMC_IP=
}/redfish/v1/Managers/bmc/LogServices/Dump/attachment/&lt;dump-id&gt;  &gt;=
 BMC_dump.tar.gz<span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inhe=
rit;display:block;height:unset"></span>Get BMC dump Progress<br style=3D"bo=
x-sizing:inherit">curl -k -H &quot;X-Auth-Token: $bmc_token&quot; -X GET ht=
tps://${BMC_IP}/redfish/v1/TaskService/Tasks/&lt;task_ID&gt;</pre></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Jun 18, 2021 at 1:32 AM Mahesh Kurapati &lt;<a href=3D"mailto:mahesh.k=
urapati@keysight.com">mahesh.kurapati@keysight.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"gmail-m_8907564346643284WordSection1">
<p class=3D"MsoNormal">Hello, <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">How to use the services of phosphor-debug-collector?=
 Readme says it can help retrieve the debug data for debugging.=C2=A0 How t=
o collect this data/trigger the log collection?
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thank you, <br>
Mahesh<u></u><u></u></p>
</div>
</div>

</blockquote></div>

--0000000000008d82f305c5419ca5--
