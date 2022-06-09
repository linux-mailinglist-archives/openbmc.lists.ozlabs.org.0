Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247C5452F4
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 19:30:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJrhk6j9Mz3bsv
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 03:30:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H4IFM68I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=jebr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H4IFM68I;
	dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJrhM2Q3Rz3bjX
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 03:30:09 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id p69so4065808iod.0
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oR442ghduVHJgUnqhjj9mX2UY1msL7DwscByYVT1Lnk=;
        b=H4IFM68IbbS0ZmTAGGXQ4KHpfiednFKkRGF/v4skQJJpcE05HJGkPDgSjP0tlJjN7Y
         Lr7MumzobYZJsubrUc2sXdejK8+a0RAdNydKlM5QLhG2y3wrTv/BeKIpoeVlEQUU2i4m
         hqHPIDktc/QyVeOtChBWO1I5LrHhdWX7+atwljdOUcv+0zCzvX7sAaqbKZTSVXNeKuPF
         dCcxslW0jpDyFsSTqvo2TJgTPeFcrgKScDzhnkxZJD2eWs4vedQULprNkXIC+dQ3A4Gt
         7EqkKIy6oYoqMD1Tfgxue1rOi3cyyMYFtrIQZw0YzPonoDwx0KytNxVwH+s8kR6w0lX9
         zWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oR442ghduVHJgUnqhjj9mX2UY1msL7DwscByYVT1Lnk=;
        b=7UOaCMkMhmUSTtjeEJ6pTrUzOb9rd6jJHUP6VesKuK2DP2RctxNaPcOu2th11FapW4
         vptPN+Ppo2pv1WHxwcOvgaQyLWKF3qpILcs4ZC0b/gtWwjxbT+zMJD5GtKlgFAj/Fplq
         BxwGpAyv3uoqCONVvJo3EGBJRW+5nxqltaIiC1u6h3W65i3qdczVyx3G3WXwV//sKXPe
         VEMUUVlvqBLfYhWiDT8J1PsMaJ5U++ukMCV1vMqeOPn6dx/uIdNXXnI1BBypm3pkuhQA
         oSUpAnUy1CBTmLLF+Po+NOJwNbsiX0OJO77baxhhJabV5cGnoK6h2gCGyXw6vudXlXJS
         mlaQ==
X-Gm-Message-State: AOAM532Z0SMDITEF3Bh1Z+Uq3RYv21+9vjxQEqfmgjc9mZ6dI0Cugrww
	0lg2J7a3VnoW7ZyUMgpKm/qOcA9E7YZ9teV/cQyC6w==
X-Google-Smtp-Source: ABdhPJwj93lWb0LQWYWJN+ZZgpcy3CZ+jnlTRi2EdWPCBkI2vsHWAObOwKgYtDe0qHQOoakzTjR6o6MqizcGGizBPtM=
X-Received: by 2002:a05:6638:358e:b0:331:b5c8:d289 with SMTP id
 v14-20020a056638358e00b00331b5c8d289mr11040387jal.63.1654795805058; Thu, 09
 Jun 2022 10:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <790233eae1974b409954c837ccbfbaad@ztsystems.com> <F28E886F-23E1-467B-AA9E-C2C46C837B15@gmail.com>
In-Reply-To: <F28E886F-23E1-467B-AA9E-C2C46C837B15@gmail.com>
From: John Broadbent <jebr@google.com>
Date: Thu, 9 Jun 2022 10:29:54 -0700
Message-ID: <CAPw1Ef8qL7Nsn-Og88Xu3sxs658VyHeEaakqqN8F6pHkdNf6LQ@mail.gmail.com>
Subject: Re: Newbie question on Redfish URI resource names
To: Jeff Friedman <jfriedman.seattle@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000237caf05e1072cd9"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000237caf05e1072cd9
Content-Type: text/plain; charset="UTF-8"

Hello Jeff,

I am not an authority, but I will give you a quick answer for chassis ID.
For chassis bmcweb checks with the dbus mapper to find all daemon in
"/xyz/openbmc_project/inventory" that have either
the "xyz.openbmc_project.Inventory.Item.Board", or
the "xyz.openbmc_project.Inventory.Item.Chassis" interfaces. There are some
extra checks and information, but that is a simplified version of it.

See the bmcweb code that sets up the handler here
https://github.com/openbmc/bmcweb/blob/5b9e95a17fae7aaf9f8716b65345bb64ade5f403/redfish-core/lib/chassis.hpp#L206


The next question might be "how are these interfaces created", and I
believe they come from entity-manager. Entity-manager reads a json file,
and creates the corresponding dbus interfaces. I know less
about entity-manager. But this looks to be the creation of the interfaces,
which depending on the json, could be a chassis.
https://github.com/openbmc/entity-manager/blob/e45d8c71bdbae39f14a638137da9dc03474536c1/src/entity_manager.cpp#L603

Ed, Patrick, and Brad know more about this process.





On Wed, Jun 8, 2022 at 4:27 PM Jeff Friedman <jfriedman.seattle@gmail.com>
wrote:

> Hello all,
>
>
>
> New to OpenBMC, and am not clear on one thing as pertaining to the Redfish
> schema and URI resource names:
>
>
>
> The DMTF Redfish schema URIs are defined as:
>
>
>
> /redfish/v1/Chassis/{ChassisId}/
>
> /redfish/v1/Managers/{ManagerId}
>
> /redfish/v1/Systems/{ComputerSystemId}
>
>
>
> Vendors can use their own names for {ChassisId}, {ManagerId}, and
> {ComputerSystemId} as long as they conform to the syntax rules.
>
>
>
> Question: Does OpenBMC specify names for these resources as part of the
> OpenBMC spec? Or does OpenBMC just refer to the existing DMTF Redfish
> schemas?
>
>
>
> I ask because I have seen reference to the following names in examples for
> Managers and Systems on the OpenBMC website:
>
>
>
> /redfish/v1/Chassis/{ChassisId}/
>
> /redfish/v1/Managers/*bmc*/
>
>
> /redfish/v1/Systems/*system*/
>
>
>
> In summary, does OpenBMC specify these resource names as part of their
> spec, or does it refer to existing DMTF Redfish schema specs?
>
>
>
> Thank you!
>
>
>
> *Jeff Friedman*
> Sr. Field Systems Engineer | ZT Systems
>
> M: 206.819.2824 <(206)%20819-2824>
>
> <http://www.ztsystems.com/>
> <image001.gif> <http://www.ztsystems.com/>
>
>
> This email and any files transmitted with it are privileged/confidential
> and intended solely for the use of the individual to whom they are
> addressed. If you have received this email in error, you are not authorized
> to distribute it in whole or in part. This communication does not
> constitute a contract offer, amendment, or acceptance of a contract offer,
> unless explicitly stated.
>
>
>

--000000000000237caf05e1072cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Jeff,<div><br></div><div>I am not an authority,=
 but I will give you a quick answer for chassis ID. For chassis bmcweb chec=
ks with the dbus mapper to find all daemon=C2=A0in &quot;/xyz/openbmc_proje=
ct/inventory&quot; that have either the=C2=A0&quot;xyz.openbmc_project.Inve=
ntory.Item.Board&quot;, or the=C2=A0&quot;xyz.openbmc_project.Inventory.Ite=
m.Chassis&quot; interfaces. There are some extra checks and information, bu=
t that is a simplified version=C2=A0of it.=C2=A0</div><div><br></div><div>S=
ee the bmcweb code that sets up the handler here=C2=A0<a href=3D"https://gi=
thub.com/openbmc/bmcweb/blob/5b9e95a17fae7aaf9f8716b65345bb64ade5f403/redfi=
sh-core/lib/chassis.hpp#L206">https://github.com/openbmc/bmcweb/blob/5b9e95=
a17fae7aaf9f8716b65345bb64ade5f403/redfish-core/lib/chassis.hpp#L206</a></d=
iv><div><br></div><div><br></div><div>The next question might be &quot;how =
are these interfaces created&quot;, and I believe they come from=C2=A0entit=
y-manager. Entity-manager reads a json file, and creates the corresponding=
=C2=A0dbus interfaces. I know less about=C2=A0entity-manager. But this look=
s to be the creation of the interfaces, which depending on the json, could =
be a chassis.=C2=A0<br><a href=3D"https://github.com/openbmc/entity-manager=
/blob/e45d8c71bdbae39f14a638137da9dc03474536c1/src/entity_manager.cpp#L603"=
>https://github.com/openbmc/entity-manager/blob/e45d8c71bdbae39f14a638137da=
9dc03474536c1/src/entity_manager.cpp#L603</a></div><div><br></div><div>Ed, =
Patrick, and Brad know more about this process.=C2=A0</div><div><br></div><=
div><br></div><div><br></div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 8, 2022 at 4:27 PM =
Jeff Friedman &lt;<a href=3D"mailto:jfriedman.seattle@gmail.com">jfriedman.=
seattle@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">=
<span style=3D"font-family:Calibri,sans-serif;font-size:11pt">Hello all,</s=
pan></div><div dir=3D"ltr"><div><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">New to OpenBMC, and am not clear on one thing as per=
taining to the Redfish schema and URI resource names:<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">The DMTF Redfish schema URIs are defined as:<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">/redfish/v1/Chassis/{ChassisId}/<u></u><u></u></p>
<p class=3D"MsoNormal">/redfish/v1/Managers/{ManagerId}<u></u><u></u></p>
<p class=3D"MsoNormal">/redfish/v1/Systems/{ComputerSystemId}<u></u><u></u>=
</p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Vendors can use their own names for {ChassisId}, {Ma=
nagerId}, and {ComputerSystemId} as long as they conform to the syntax rule=
s.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Question: Does OpenBMC specify names for these resou=
rces as part of the OpenBMC spec? Or does OpenBMC just refer to the existin=
g DMTF Redfish schemas?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I ask because I have seen reference to the following=
 names in examples for Managers and Systems on the OpenBMC website:<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">/redfish/v1/Chassis/{ChassisId}/=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <u=
></u><u></u></p>
<p class=3D"MsoNormal">/redfish/v1/Managers/<b><i>bmc</i></b>/=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
<u></u><u></u></p>
<p class=3D"MsoNormal">/redfish/v1/Systems/<b><i>system</i></b>/=C2=A0=C2=
=A0=C2=A0=C2=A0 <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">In summary, does OpenBMC specify these resource name=
s as part of their spec, or does it refer to existing DMTF Redfish schema s=
pecs?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thank you!<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><b><span style=3D"color:rgb(223,72,38)">Jeff Friedma=
n</span></b><span style=3D"font-size:9pt;color:rgb(31,73,125)"><br>
</span><span style=3D"font-size:9pt;color:gray">Sr. Field Systems Engineer =
| ZT Systems</span><span style=3D"font-size:9pt;color:rgb(68,84,106)"><u></=
u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"font-siz=
e:9pt;color:rgb(127,127,127)">M: <a href=3D"tel:(206)%20819-2824" value=3D"=
+12068192824" target=3D"_blank">206.819.2824</a><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><a href=3D"http://www.z=
tsystems.com/" target=3D"_blank"><span style=3D"font-size:10.5pt;font-famil=
y:Arial,sans-serif;color:rgb(74,88,171);text-decoration:none"></span></a></=
p><div><a href=3D"http://www.ztsystems.com/" target=3D"_blank">&lt;image001=
.gif&gt;</a></div><span style=3D"font-size:10.5pt;font-family:Arial,sans-se=
rif;color:rgb(109,110,113)"><br>
<br>
</span><span style=3D"font-size:7pt;font-family:Arial,sans-serif;color:rgb(=
127,127,127)">This email and any files transmitted with it are privileged/c=
onfidential and intended solely for the use of the individual to whom they =
are addressed. If you have received this
 email in error, you are not authorized to distribute it in whole or in par=
t. This communication does not constitute a contract offer, amendment, or a=
cceptance of a contract offer, unless explicitly stated.</span><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(109,110,113)">=
=C2=A0</span><u></u><u></u><p></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>


</div></div></blockquote></div>

--000000000000237caf05e1072cd9--
