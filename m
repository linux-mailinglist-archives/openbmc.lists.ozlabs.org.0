Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA705E9C5B
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 10:47:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbbwx73NKz2yph
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 18:47:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l3FyNT3Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=kumarthangavel.hcl@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l3FyNT3Z;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbbwV0W0zz2xsL
	for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 18:47:04 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d24so5610202pls.4
        for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=230UMlm5jzN6DFBSFjvBJIxBbXFnPfiSY3vNvPJxuCs=;
        b=l3FyNT3ZsHJcmzd7eqRw2nQul9JCQcMAZixYuu1eyPu/WTJ1kKTRk8r1Y2JenEWd70
         /UsXfuuIqi+1+ibhf2egQ2L9gPKIh/3xceIsa2XMt0Gq/HXWcS2Zbq6eu9XpbSjFQJCG
         fMVSC0PnzhXZlWyfZyNSFwrtamw4dQyprIALHXW6JSzdcDjJHfSFbDjr6WQPdvX1K/Qc
         aL9zGcPXKg+DLJL9N6NtN1WyAjtwB87jnPHWrmubmBVxNDvBs4uQtuTjcnLuAclWUkkX
         XVafx/dCsQEEMZ7A2v7wGzkZ0IHy6KQILRKs7P0bFCdyQ5G42p3uZePgKyr8oot7kwGH
         8ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=230UMlm5jzN6DFBSFjvBJIxBbXFnPfiSY3vNvPJxuCs=;
        b=OhXEXx0IfkJnQX6HnnWSwXJqa9wxCRejvlqlcOGCpbOajuP5WqiLZGNeLNPYDIF36I
         2P9/eLEaoTC1+d1HA1R/PjOCGvAstDZggeVcXKmBqUiOQYR0TUAsjQoUTEonMQGjx58M
         phYVFp160fZmfWWU/TjpXVA8QE07ilxqnGaB0mCzxcuh6rtRlGxbvbUAd2W/1qpWi6F+
         MxPhi8pWtMC1IMvjue79mkTri06Sfck3mtEhGndRzYn2ftzIuaa82WSIpN0ZgESYoTs5
         bZAiCB1btCn5V2s3bIlkjoUXxiNbtOL5vM+cJlH+vXPncXaTAMllVuB21cNxPTfCNETp
         BTpw==
X-Gm-Message-State: ACrzQf0JUgoycjSqd6NyDDAGkJqxlVJY5ka3Ly8Nr4Vu64whzYYMRtyG
	lO6Swrl0Yqwo/1A7qTHQlAgOvCCnZzJmgq37trs=
X-Google-Smtp-Source: AMsMyM69NH83PQp7uoKK8sB6Eu088vkx2PUWWuNgWUMyacf/0fVcdlD739qdmwrMz6p1RxNIxHJhhQ4aPIX1j47mBjs=
X-Received: by 2002:a17:902:d355:b0:176:cd80:5b32 with SMTP id
 l21-20020a170902d35500b00176cd805b32mr21417927plk.68.1664182022820; Mon, 26
 Sep 2022 01:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7TbcsX-+EWCVjNMoB3n4qRWp1_1fOLWkM_8qK1UTXqQ-GgSw@mail.gmail.com>
 <Yy4p8vbQfOq/jxWe@heinlein>
In-Reply-To: <Yy4p8vbQfOq/jxWe@heinlein>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 26 Sep 2022 14:16:51 +0530
Message-ID: <CAA7TbcukOUXgrXXxOh7MDZg8KazC4ZCUD7nMY8nveVgn9OKdKg@mail.gmail.com>
Subject: Re: Rescan busses for FRU device removal/unplug
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000004fd5e905e9909205"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>, velumani.hcl@gmail.com, garnermic@gmail.com, velumanit@hcl.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004fd5e905e9909205
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 24, 2022 at 3:19 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Sep 20, 2022 at 02:19:38PM +0530, Kumar Thangavel wrote:
> > Hi All,
> >
> > Whenever Rescan function is called, it is removing all fru devices and
> > their interfaces from dbus and scans all busses and adding all other
> > devices and dbus interfaces.
> >
> > If ReScan function is called, incase of removing/unplugging only one FRU
> > device from the system, then it will remove all fru devices from the
> system
> > and their interfaces instead of removing one device. So, all the FRU's
> and
> > associated sensors and their dbus interfaces were also removed. Then
> scans
> > all buses and adds newly scanned devices and dbus interfaces.
> >
> > Ex : If a system has 5 FRU devices, then one FRU device is
> > removed/unplugged, it will remove all devices and scan all buses and
> > recreate the 4 FRU devices.
> >
> > I think Some additional removal of other FRU devices and
> adding/recreating
> > other FRU devices is happening here. So, to avoid this issue, We can keep
> > both old and new scanning lists and compare the devices in the list and
> > remove only the unplugged FRU devices and their dbus interfaces and keep
> > other FRU devices as it is. This is also applicable for adding(plug) new
> > FRU to the system.
> >
> > Please share your thoughts on this.
>
> Isn't there a 'ReScanBus' call also?  Does this do what you need?
>
> No. You mean rescanOneBus function ?  It scans one specific bus based on
the busNum parameter.
This rescanOneBus also removes that particular bus Fru and their dbus
interface completely and rescanning
the bus.
What I am proposing is, Instead of removing already scanned devices and
dbus operations and rescan the bus and devices,          The already
scanned devices list and its information is not to be cleared and it would
be compared with new scan information and      updated in the dbus
accordingly.

    This saves some additional removal of scanned devices and dbus
operations. we may need to refactor some portions of code in the
FruDevice.cpp file.

 Thanks & Regards,
 Kumar.


> --
> Patrick Williams
>

--0000000000004fd5e905e9909205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 24, 2022 at 3:19 AM Patri=
ck Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tu=
e, Sep 20, 2022 at 02:19:38PM +0530, Kumar Thangavel wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; Whenever Rescan function is called, it is removing all fru devices and=
<br>
&gt; their interfaces from dbus and scans all busses and adding all other<b=
r>
&gt; devices and dbus interfaces.<br>
&gt; <br>
&gt; If ReScan function is called, incase of removing/unplugging only one F=
RU<br>
&gt; device from the system, then it will remove all fru devices from the s=
ystem<br>
&gt; and their interfaces instead of removing one device. So, all the FRU&#=
39;s and<br>
&gt; associated sensors and their dbus interfaces were also removed. Then s=
cans<br>
&gt; all buses and adds newly scanned devices and dbus interfaces.<br>
&gt; <br>
&gt; Ex : If a system has 5 FRU devices, then one FRU device is<br>
&gt; removed/unplugged, it will remove all devices and scan all buses and<b=
r>
&gt; recreate the 4 FRU devices.<br>
&gt; <br>
&gt; I think Some additional removal of other FRU devices and adding/recrea=
ting<br>
&gt; other FRU devices is happening here. So, to avoid this issue, We can k=
eep<br>
&gt; both old and new scanning lists and compare the devices in the list an=
d<br>
&gt; remove only the unplugged FRU devices and their dbus interfaces and ke=
ep<br>
&gt; other FRU devices as it is. This is also applicable for adding(plug) n=
ew<br>
&gt; FRU to the system.<br>
&gt; <br>
&gt; Please share your thoughts on this.<br>
<br>
Isn&#39;t there a &#39;ReScanBus&#39; call also?=C2=A0 Does this do what yo=
u need?<br>
<br></blockquote><div>No. You mean rescanOneBus function ?=C2=A0 It scans o=
ne specific bus based on the busNum parameter.</div><div>This rescanOneBus =
also removes that particular bus Fru and their dbus interface completely an=
d rescanning</div><div>the bus.=C2=A0=C2=A0<br>What I am proposing is, Inst=
ead of removing already scanned devices and dbus operations and rescan the =
bus and devices,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The already scanned devi=
ces list and its information is not to be cleared and it would be compared =
with new scan information and=C2=A0 =C2=A0 =C2=A0 updated in the dbus accor=
dingly.=C2=A0</div><div><br></div><div>=C2=A0 =C2=A0 This saves some additi=
onal removal of scanned devices and dbus operations. we may need to refacto=
r some portions of code in the FruDevice.cpp file.</div><div><br></div><div=
>=C2=A0Thanks &amp; Regards,</div><div>=C2=A0Kumar.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--0000000000004fd5e905e9909205--
