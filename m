Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954277228A6
	for <lists+openbmc@lfdr.de>; Mon,  5 Jun 2023 16:19:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZbN81vbsz3f0f
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 00:19:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r7GGsIF2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=raviteja28031990@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r7GGsIF2;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZbMb4hZWz3bVP
	for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2023 00:19:22 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2568caabfbfso2268461a91.3
        for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2023 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974758; x=1688566758;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnCRgNkLuql85huv25ujYTUl5tjTlulPXvbaxBfwBUs=;
        b=r7GGsIF2BsquRUWBi8Anv1IYdpMO/2JMyMrSOJJ43DpVwUOyGpoWaSKZuKUFUgCXvt
         vw63P2u9trdf5sfiK14uV9hpDrTUoYSwUjMv6CCgrixg6/uxZ68fja6wdXd0MFB7O3ad
         K/EEZgBsm1jvfI9iKYPYFsxh7CSQyxA9+L3jhRtdFLWraiQHMZap23z6BmJvwor92q+B
         396Df/kj1mwv8P2EGCvuC7IEBdnfzg9+8MfetRYIOcqowJEz7s0x1eYsPsL5TDDjQPVJ
         IMQRh+zLdKc/03PP3o9jHnMCovB/bQ/T7MuStQAUf7cucTslCsr8R82N/clRAuJuphw2
         JBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974758; x=1688566758;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnCRgNkLuql85huv25ujYTUl5tjTlulPXvbaxBfwBUs=;
        b=D1VwWm7VqDFhPFSAbDHsDWj++gJp42z5wjYYk4Q9zUNl6piAxYZb6Oz5dUfZjOUk+l
         t2Zsp4xd1DXIMrBAxxyIlJg3kgN5llCor9w21wL5gcCiSPrbX/XPa/y0ERV690TWRHcj
         6/AN1XNRHpP+sDfHxLamVLiz4CqnUuvQlBZsZTxheCtjwp2NomDZwG6je7pcL54nJUbP
         xGsCjqTnEDpU3KGNvuRV1jJZ5wATjU4UYuCe+zPfjrSwwwPm6rpNhRSRi+zxSAwr83ye
         ObsZ67o8301/vBRVL/VhJQwKziWP2exXIriLGYJ8lwgrlvRZMlTUh/mZJMdvGmahqQaj
         qUxQ==
X-Gm-Message-State: AC+VfDyolvzxWckRqvSv2SLJgRHc0BAHvIbRNPQY+E8Vuru9E5ZCwCuZ
	IDk+lCwhiec6dcOZs0i1jjZWIr6lKmtZC78bsUI/1qzIR4I=
X-Google-Smtp-Source: ACHHUZ6Z0BSuRBAi/ycjUwh20L+jQ+5DrKgd2kkPW3+ad89k52BCiAJNwbuBeuvIFFpEd3gKysUc5UcvOZ00DzElklc=
X-Received: by 2002:a17:90a:420a:b0:259:b73:f508 with SMTP id
 o10-20020a17090a420a00b002590b73f508mr2905645pjg.1.1685974758366; Mon, 05 Jun
 2023 07:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
 <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com> <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
 <7230376b-c7f4-b931-faff-27a4da1b38a9@gmail.com>
In-Reply-To: <7230376b-c7f4-b931-faff-27a4da1b38a9@gmail.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Mon, 5 Jun 2023 19:49:06 +0530
Message-ID: <CAM4DKZ=-pHzz-OuOyszYmrHMWog5uNpB-S4mQtQaVrY2iJ5=BQ@mail.gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config support
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000092a56205fd629681"
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

--00000000000092a56205fd629681
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All


Gentle reminder for the feedback on Static route feature


I have pushed a DMTF proposal and DMTF PR for adding static route
configuration to EthernetInterface schema.

Here is DMTF redfish PR to enable redfish static route configuration
https://github.com/DMTF/Redfish/pull/5464


This PR adds IPv4StaticRoutes resource under EthernetInterface schema which
allows clients to configure multiple static routes per interface.

Example:

"IPv4StaticRoutes": [

     {

            "NextHopAddress": "192.168.1.1",

            "DestinationAddress": "192.168.1.2",

            "SubnetMask": "255.255.255.255"

     },

     {

            "NextHopAddress": "192.168.2.1",

            "DestinationAddress": "192.1.2.0",

            "SubnetMask": "255.255.255.0"

     }]


This PR was reviewed and discussed in the DMTF meeting recently and one of
the suggestion from DMTF members were to check for community interest in
having this use case.


Would like to hear community views in allowing the user to add a static
route.


Thanks,

Raviteja

On Tue, Jul 26, 2022 at 2:55=E2=80=AFPM Sunitha Harish <sunithaharish04@gma=
il.com>
wrote:

>
> On 23-06-2022 15:57, raviteja bailapudi wrote:
>
> Hi, Jiaqing
>
> We have noticed an issue while using Static IPv4 addresses on both eth0
> and eth1.
> We have configured a static private IP with the matching subnet of Laptop
> Connected on eth0 and  configured a static public IP on eth1.
> Both routes have got the metric value 0. eth0 route is the first entry of
> the routing table which was being used for routing.
>
>
> Ping to eth1 IP <9.x.x.84> does not work and that Eth0 private IP pings
> from the laptop connected.
>
> * IP  Config:*
>
>
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
> 1000
>
>     link/ether 08:94:ef:82:4c:76 brd ff:ff:ff:ff:ff:ff
>
>     inet 169.254.7.123/16 brd 169.254.255.255 scope link eth0
>
>        valid_lft forever preferred_lft forever
>
>     inet 10.x.x.100/24 brd 10.6.6.255 scope global eth0.          =E2=80=
=94>
> Private IP (Connected to laptop)
>
>        valid_lft forever preferred_lft forever
>
>     inet6 fe80::a94:efff:fe82:4c76/64 scope link
>
>        valid_lft forever preferred_lft forever
>
> 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
> 1000
>
>     link/ether 08:94:ef:82:4c:77 brd ff:ff:ff:ff:ff:ff
>
>     inet 9.x.x.84/24 brd 9.x.x.255 scope global eth1.               =E2=
=80=94>
> Public IP
>
>        valid_lft forever preferred_lft forever
>
>     inet6 fe80::a94:efff:fe82:4c77/64 scope link
>
>        valid_lft forever preferred_lft forever
>
>
>
> * Routing table:*
>
> Kernel IP routing table
>
> Destination     Gateway         Genmask         Flags   MSS   Window  irt=
t
> Iface
>
> 0.0.0.0                10.x.x.1             0.0.0.0           UG         =
0
>       0           0   eth0
>
> 0.0.0.0                 9.x.x.1              0.0.0.0           UG        =
0
>       0           0   eth1  <<=3D=3D=3D=3D not pingable.
>
> 9.x.x.0                 0.0.0.0         255.255.255.0   U          0
>   0           0   eth1
>
> 10.x.x.0               0.0.0.0         255.255.255.0   U          0
>   0          0   eth0
>
> 169.254.0.0        0.0.0.0         255.255.0.0        U          0
>   0          0   eth0
>
>
>
> But with DHCP enabled on eth1, dhcp subnet with metric value 1024 was
> always at the bottom and was reachable
> as DHCP routes  get priority over static routes.
>
>
> Its good if Redfish has a way to set the metric value as an optional
> parameter while user PATCHes the Static IP address. This can be used by
> phosphor-networkd to set the route priority on that interface while addin=
g
> route for this IP.
>
>
> Regards,
>
> Raviteja
>
> On Thu, Jun 23, 2022 at 12:34 PM Jiaqing Zhao <
> jiaqing.zhao@linux.intel.com> wrote:
>
>> Hi, Raviteja
>>
>> Can you help explain the routing issue you met?
>>
>> I've also met a metric-related issue. When there are 2 interfaces, one
>> use DHCP,
>> the other use Static, systemd-networkd sets the metric 1024 on the
>> DHCP-assigned
>> default routev (metric for static default gateway is 0), which causing
>> peers
>> only reachable via the DHCP-assigned default route cannot be accessed.
>>
>> And in current OpenBMC implementation, I think we should allow setting
>> null to
>> Gateway of IPv4StaticAddress to not set default route on that interface.
>>
>> Thanks,
>> Jiaqing
>>
>> On 2022-06-22 18:50, raviteja bailapudi wrote:
>> > Hi Team
>> >
>> > We have hit network routing issues while using Static IPv4 addresses o=
n
>> > both eth0 and eth1,  as both default gateways at the interfaces were o=
f
>> the
>> > same metric value. To solve this problem we are planning to provide an
>> > interface for admins to set the metric value for the gateway while
>> setting
>> > up the Static IPv4 network on BMC.
>> >
>> >
>> > To enable users to connect from outside-subnet clients, we also need t=
o
>> > support static routes on BMC.
>> >
>> >
>> > I have started a thread in redfish forum as well
>> >
>> >
>> https://redfishforum.com/thread/683/network-routing-table-management-sup=
port
>> >
>> >
>> > Please share your views on the same.
>> >
>> >
>> >
>> > Regards,
>> >
>> > Raviteja
>> >
>>
>

--00000000000092a56205fd629681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px;font-stretch:normal;font-size:13px;=
line-height:normal;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:=
none;font-kerning:auto;font-variant-alternates:normal;font-variant-ligature=
s:normal;font-variant-numeric:normal;font-variant-east-asian:normal;font-fe=
ature-settings:normal">Hi All</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Gentle reminder for the feedback on Static route feature<span class=
=3D"gmail-Apple-converted-space">=C2=A0</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">I have pushed a DMTF proposal and DMTF PR for adding static route con=
figuration to EthernetInterface schema.</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Here is DMTF redfish PR to enable redfish static route configuration =
<a href=3D"https://github.com/DMTF/Redfish/pull/5464"><span style=3D"color:=
rgb(220,161,13)">https://github.com/DMTF/Redfish/pull/5464</span></a></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">This PR adds IPv4StaticRoutes resource under EthernetInterface schema=
 which allows clients to configure multiple static routes per interface.</p=
>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Example:</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">&quot;IPv4StaticRoutes&quot;: [</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0</spa=
n>{</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>&quot;NextHopAddress&quot;: &quot;192.168.1.1&quot=
;,</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>&quot;DestinationAddress&quot;: &quot;192.168.1.2&=
quot;,</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>&quot;SubnetMask&quot;: &quot;255.255.255.255&quot=
;</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </spa=
n>},</p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-heig=
ht:normal;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font=
-kerning:auto;font-variant-alternates:normal;font-variant-ligatures:normal;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-feature-set=
tings:normal">=C2=A0 =C2=A0 =C2=A0{</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>&quot;NextHopAddress&quot;: &quot;192.168.2.1&quot=
;,</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>&quot;DestinationAddress&quot;: &quot;192.1.2.0&qu=
ot;,</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>&quot;SubnetMask&quot;: &quot;255.255.255.0&quot;<=
/p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </spa=
n>}]</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">This PR was reviewed and discussed in the DMTF meeting recently and o=
ne of the suggestion from DMTF members were to check for community interest=
 in having this use case.</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal;min-height:15px"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none;font-kerning=
:auto;font-variant-alternates:normal;font-variant-ligatures:normal;font-var=
iant-numeric:normal;font-variant-east-asian:normal;font-feature-settings:no=
rmal">Would like to hear community views in allowing the user to add a stat=
ic route.</p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line=
-height:normal;font-family:&quot;Helvetica Neue&quot;;font-size-adjust:none=
;font-kerning:auto;font-variant-alternates:normal;font-variant-ligatures:no=
rmal;font-variant-numeric:normal;font-variant-east-asian:normal;font-featur=
e-settings:normal"><br></p><p style=3D"margin:0px;font-stretch:normal;font-=
size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;;font-si=
ze-adjust:none;font-kerning:auto;font-variant-alternates:normal;font-varian=
t-ligatures:normal;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-feature-settings:normal">Thanks,</p><p style=3D"margin:0px;font-str=
etch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica N=
eue&quot;;font-size-adjust:none;font-kerning:auto;font-variant-alternates:n=
ormal;font-variant-ligatures:normal;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-feature-settings:normal">Raviteja=C2=A0</p></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Jul 26, 2022 at 2:55=E2=80=AFPM Sunitha Harish &lt;<a href=3D"mailto:sunit=
haharish04@gmail.com">sunithaharish04@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padd=
ing-left:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 23-06-2022 15:57, raviteja bailapudi
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hi, Jiaqing
        <div><br>
        </div>
        <div>
          <p>We have noticed an issue while using Static IPv4
            addresses on both eth0 and eth1.<br>
            We have configured a static private IP with the matching
            subnet of Laptop Connected on eth0 and<span>=C2=A0 </span>confi=
gured a
            static public IP on eth1.<br>
            Both routes=C2=A0have got=C2=A0the metric value 0. eth0 route i=
s the
            first entry of the routing table which was being used for
            routing.<br>
          </p>
          <p><br>
          </p>
          <p>Ping to eth1 IP &lt;9.x.x.84&gt; does not work
            and that Eth0 private IP pings from the laptop connected.<br>
            <br>
            <b>
              IP<span>=C2=A0 </span>Config:</b><br>
          </p>
          <p><br>
          </p>
          <p>2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt;
            mtu 1500 qdisc pfifo_fast qlen 1000</p>
          <p><span>=C2=A0 =C2=A0 </span>link/ether
            08:94:ef:82:4c:76 brd ff:ff:ff:ff:ff:ff</p>
          <p><span>=C2=A0 =C2=A0 </span>inet
            <a href=3D"http://169.254.7.123/16" target=3D"_blank">169.254.7=
.123/16</a>
            brd 169.254.255.255 scope link eth0</p>
          <p><span>=C2=A0=C2=A0 =C2=A0 =C2=A0
            </span>valid_lft forever preferred_lft forever</p>
          <p><span>=C2=A0 =C2=A0 </span>inet
            10.x.x.100/24 brd 10.6.6.255 scope global eth0.<span>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>=E2=80=94&gt;
            Private IP (Connected to laptop)</p>
          <p><span>=C2=A0=C2=A0 =C2=A0 =C2=A0
            </span>valid_lft forever preferred_lft forever</p>
          <p><span>=C2=A0 =C2=A0 </span>inet6
            fe80::a94:efff:fe82:4c76/64 scope link</p>
          <p><span>=C2=A0=C2=A0 =C2=A0 =C2=A0
            </span>valid_lft forever preferred_lft forever</p>
          <p>3: eth1: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt;
            mtu 1500 qdisc pfifo_fast qlen 1000</p>
          <p><span>=C2=A0 =C2=A0 </span>link/ether
            08:94:ef:82:4c:77 brd ff:ff:ff:ff:ff:ff</p>
          <p><span>=C2=A0 =C2=A0 </span>inet
            9.x.x.84/24 brd 9.x.x.255 scope global eth1. <span>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=E2=80=94&gt;
            Public IP<span>=C2=A0</span></p>
          <p><span>=C2=A0=C2=A0 =C2=A0 =C2=A0
            </span>valid_lft forever preferred_lft forever</p>
          <p><span>=C2=A0 =C2=A0 </span>inet6
            fe80::a94:efff:fe82:4c77/64 scope link</p>
          <p><span>=C2=A0=C2=A0 =C2=A0 =C2=A0
            </span>valid_lft forever preferred_lft forever</p>
          <p><br>
            <br>
            <b>
              Routing table:</b><br>
            <br>
            Kernel IP routing table</p>
          <p>Destination <span>=C2=A0 =C2=A0 </span>Gateway <span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>Genmask
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Flags
            <span>=C2=A0 </span>MSS <span>=C2=A0 </span>Window<span>=C2=A0 =
</span>irtt<span>=C2=A0 </span>Iface</p>
          <p>0.0.0.0<span>=C2=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>10.x.=
x.1 <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0.0.0.0
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>UG
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0
            <span>=C2=A0 =C2=A0 =C2=A0 </span>0 <span>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>0 <span>=C2=A0 </span>eth0</p>
          <p>0.0.0.0 <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span>9.x.x.1<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0.0.0.0
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>UG<span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>0<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <sp=
an>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span>=C2=A0 </span>eth1<spa=
n>=C2=A0 </span>&lt;&lt;=3D=3D=3D=3D
            not pingable.<span>=C2=A0</span></p>
          <p>9.x.x.0 <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 </span>0.0.0.0
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>255.255.255.0
            <span>=C2=A0 </span>U<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>0<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>0 <span>=C2=A0 </span>eth1</p>
          <p>10.x.x.0 <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0.0.0.0
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>255.255.255.0
            <span>=C2=A0 </span>U<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>0 <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0<span>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>0 <span>=C2=A0 </span>eth0</p>
          <p>169.254.0.0<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0.0.0.0
            <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>255.255.0.0<span>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>U<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>0 <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0<span>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>0 <span>=C2=A0 </span>eth0</p>
          <p><br>
            <br>
            But with DHCP enabled on eth1, dhcp subnet with metric value
            1024 was always at the bottom and was reachable<br>
            as DHCP routes<span>=C2=A0 </span>get
            priority over static routes.=C2=A0</p>
          <p><br>
          </p>
        </div>
      </div>
    </blockquote>
    <p>Its good if Redfish has a way to set the metric value as an
      optional parameter while user PATCHes the Static IP address. This
      can be used by phosphor-networkd to set the route priority on that
      interface while adding route for this IP.<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>
          <p><br>
          </p>
          <p>Regards,</p>
          <p>Raviteja</p>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 12:34
          PM Jiaqing Zhao &lt;<a href=3D"mailto:jiaqing.zhao@linux.intel.co=
m" target=3D"_blank">jiaqing.zhao@linux.intel.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex">Hi,
          Raviteja<br>
          <br>
          Can you help explain the routing issue you met?<br>
          <br>
          I&#39;ve also met a metric-related issue. When there are 2
          interfaces, one use DHCP,<br>
          the other use Static, systemd-networkd sets the metric 1024 on
          the DHCP-assigned<br>
          default routev (metric for static default gateway is 0), which
          causing peers<br>
          only reachable via the DHCP-assigned default route cannot be
          accessed.<br>
          <br>
          And in current OpenBMC implementation, I think we should allow
          setting null to<br>
          Gateway of IPv4StaticAddress to not set default route on that
          interface.<br>
          <br>
          Thanks,<br>
          Jiaqing<br>
          <br>
          On 2022-06-22 18:50, raviteja bailapudi wrote:<br>
          &gt; Hi Team<br>
          &gt; <br>
          &gt; We have hit network routing issues while using Static
          IPv4 addresses on<br>
          &gt; both eth0 and eth1,=C2=A0 as both default gateways at the
          interfaces were of the<br>
          &gt; same metric value. To solve this problem we are planning
          to provide an<br>
          &gt; interface for admins to set the metric value for the
          gateway while setting<br>
          &gt; up the Static IPv4 network on BMC.<br>
          &gt; <br>
          &gt; <br>
          &gt; To enable users to connect from outside-subnet clients,
          we also need to<br>
          &gt; support static routes on BMC.<br>
          &gt; <br>
          &gt; <br>
          &gt; I have started a thread in redfish forum as well<br>
          &gt; <br>
          &gt; <a href=3D"https://redfishforum.com/thread/683/network-routi=
ng-table-management-support" rel=3D"noreferrer" target=3D"_blank">https://r=
edfishforum.com/thread/683/network-routing-table-management-support</a><br>
          &gt; <br>
          &gt; <br>
          &gt; Please share your views on the same.<br>
          &gt; <br>
          &gt; <br>
          &gt; <br>
          &gt; Regards,<br>
          &gt; <br>
          &gt; Raviteja<br>
          &gt; <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--00000000000092a56205fd629681--
