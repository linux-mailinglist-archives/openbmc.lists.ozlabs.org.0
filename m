Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709BF48B3B4
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 18:23:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYHbL2Brfz302S
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 04:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oCPQxEyy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=oCPQxEyy; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYHZx5Rhxz2xCy
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 04:23:03 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id t28so27551872wrb.4
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5E9azGNmKh2A5buy3OieqsALuowXfXSNVGVH6wVtvS4=;
 b=oCPQxEyy9VacsAkgBbpArnzKL6g2SDoqEJq9zyEIQqKBLtT7GOK5Bq4T1MbFPs1+B4
 19A09Trkq+uk9APzmHgyKrwL85qvmjnX0ylfGkAA6y0F6EVGtzf9pIITsjuPAFdsrj7S
 CiKUvt0QrLjF3uP7zc/fd3e0Cgg0hznpDzk5w811dEFFj48HTnZ4G91nFp0hVc1xB8Fj
 IODPpdJxdUg+c0K0KUeWtLhIS53bXRIj9uZNS5fzwcftll/4SPo1Ga3Pbet9DgiOAqe9
 ijZCi9qIdKJ43DT1tvm7Iv/nyWjiB7EZLyYoaZE8dNzKnbKdMolxpppSTGz5s7W7ZSNv
 3n3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5E9azGNmKh2A5buy3OieqsALuowXfXSNVGVH6wVtvS4=;
 b=wDmmuMfhFRTjQra1PY0ZV0zqYN5B797mYURdbx+fZIB11n6pTqMCujOPfbGI9bYLB4
 GJN03z7axHzh20XmSx1nBO67X7a3RPH9avD+WHKIHZaNg/exFh/g1mcM35gRP4mV8K91
 AobiwVPpexy9LKV7dgp88I6O+Ev4+GtOE0PC6GR4ViZPz8hxBFxMMUFuV/DcLSq/SBHm
 HJFPDvLBaMmshH2VQXm7gn5wBpgCJELnyAq//S7HGRsiCYCoeEkKxNI19oOhYA0dy8Rc
 sJFrjUT315yh+pHEicHd0NljwVXGA78nDQJr0cL5VSxlQuqt40gLYdLEBao+s8js3SUv
 GnQg==
X-Gm-Message-State: AOAM530JtRA4JQ1dft7znYRVk9k35T3wYa9KqXEdEWx14D2oGVwrfxdy
 Dk42q7e7sbj2pY1vtEZcZHvkMunuwhD9ZkD9gRyLaQ==
X-Google-Smtp-Source: ABdhPJyaunGPtft1z9aceTc1VSga90LW5ulJ4mu3ieeo8p/gbx12k+dfG+ANj58X6IulVFrN2dTPjaajsflTA/z2m00=
X-Received: by 2002:a5d:6e90:: with SMTP id k16mr4716259wrz.112.1641921775381; 
 Tue, 11 Jan 2022 09:22:55 -0800 (PST)
MIME-Version: 1.0
References: <9049D645-3D91-4302-881A-E5FD287FE22C@gmail.com>
In-Reply-To: <9049D645-3D91-4302-881A-E5FD287FE22C@gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 11 Jan 2022 09:22:44 -0800
Message-ID: <CAH2-KxBPXa6woa-9cFQ_Bn1Oqk3OYFKLPf2jpRU0mgRm443S1A@mail.gmail.com>
Subject: Re: Query Sensor
To: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 11, 2022 at 9:17 AM Mike Jones <proclivis@gmail.com> wrote:
>
> =EF=BB=BFThis is how to do it:
>
> dbus-send --system --print-reply \
>
> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>
> /xyz/openbmc_project/sensors/temperature/lm75temp \
>
> org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sensor.Val=
ue string:Value \
>
> double:
>
>
> It is not clear to me why the second parameter string:Value
>
>
> I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is the P=
roperty name, and properties have values, so the second parameter says get =
the Value of a property whose name ends in .Value.\

For better or worse, the term "Value" is overloaded in both the
interface name, yz.openbmc_project.Sensor.Value, and the property name
within the interface, Value.  That's why you see it twice in this
case.  They are distinct things within the request that just happen to
share a name.  Docs for the interface and property are here:
https://github.com/openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36a2e8c=
f96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Value.interface.yaml=
#L24

Happy to see you figured it out.

>
>
> To test that, I tried string:MaxValue, and that works.
>
>
> I confirmed with this:
>
>
> busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da90590708=
8a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sensors/tem=
perature/lm75temp
>
>
> A very useful command.
>
>
> Also useful:
>
>
> dbus-send --system --print-reply \
>
> --dest=3Dxyz.openbmc_project.ObjectMapper /\
>
> xyz/openbmc_project/object_mapper \
>
> xyz.openbmc_project.ObjectMapper.GetSubTree \
>
> string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"
>
>
>
> Mike
>
>
> Sent from my iPad
>
> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
>
> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.com>=
 wrote:
>
>
> Hi,
>
>
> I could not find an example of a sensor query in the docs. I assume somet=
hing like this:
>
>
> dbus-send --system --print-reply \
>
>
> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>
>
> /xyz/openbmc_project/sensors/temperature/lm75temp
>
>
> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value =
\
>
>
> double:
>
>
>
> I don't have an example offhand, but the interface you're looking for
> in the bolded area is
> org.freedesktop.DBus.Properties.Get
>
> Stack overflow for essentially the same question with an example:
> https://stackoverflow.com/questions/48648952/set-get-property-using-dbus-=
send
>
>
> With the bold interface replaced with something correct.
>
>
> Can some one give me an example, and a url about how to query properties?
>
>
> Mike
>
>
> Sent from my iPad
