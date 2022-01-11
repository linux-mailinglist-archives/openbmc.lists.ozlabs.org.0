Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA348B49B
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 18:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYJFT1f1Kz30Dv
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 04:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k4ZHO5qs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f;
 helo=mail-oo1-xc2f.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k4ZHO5qs; dkim-atps=neutral
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYJF22l2tz2x9Q
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 04:52:36 +1100 (AEDT)
Received: by mail-oo1-xc2f.google.com with SMTP id
 q15-20020a4a6c0f000000b002dc415427d3so4145341ooc.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 09:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=yK2d7eJ019KrHbKePJvCLEC7WTkxZe0pCnLDb2PkmBo=;
 b=k4ZHO5qsuhdqAA+vLoCxIoO7Uuk1LY7XBhS5n3LjXuUiT5SQFCBb7SWzrVOc61yqO6
 C3j5F7JK/NfMTALBiQdzHC5u+9aT6TkzGEpN1/6uxL4iUAYsENdPM8C5DyjYkIo/zyxq
 wINJPUnez1k3jQXmyF5bcmBkOiKqPQTbM+ziXhOFfHDe+oLyc8NZSASYcl3/eHaWIIzR
 BYJ1mSc6HkP+krGXFINqchAe0Ugcxh0zXnTFe6INIjoCMjYZ8E0RgIMbWu47ordiSJ0M
 Znv+qH8mN8WubADrudVZQ+WHNGf2FkXBs6WaHj7Jw5xzDB+rVN4hrwCcfCjMXiHrKbBR
 gOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=yK2d7eJ019KrHbKePJvCLEC7WTkxZe0pCnLDb2PkmBo=;
 b=tKK5dX9JOXBgyJRiYXo+TF9fdS8ouAEUAEaS8zjrarwjupWME8piE5jPigR7Ojj9Tn
 IINyxC/DWeEaxXwkVP889eiBqFek+BmGyxoIjV5M+Qkc+SPL4Si5LmhQO2Wb1/J7G5PD
 qv2/Sh2vJ3NAsSx8L/w526RrljWExTXbziKVKJaJzSgnt2FLKosOm8U3suNHxdsRhNrs
 HqZnGbpIrVmQDNYVwEIPpUswVdIVVahGz8fW9YnrAMEF/lfUYkY3nyZjFKa/YlL3qCLg
 YPATfsFN+EAUJQHbvd7quWvpdLKcEXsvkpKGXDhbXu5hz7cGyQhlgPYxmkf4xgxoDFvF
 dP1w==
X-Gm-Message-State: AOAM5330Be+stifo9rvNWhLGgD7tcA7ZoT29a5Uz/OSS6kXSIxdJsMSt
 HQnTDoXe1/BIIXNOYOfoszdkEhm4HuU=
X-Google-Smtp-Source: ABdhPJznCLv9+DGAAHHuhf4YwEAPh9NbJKitgPhxeJtTUhryk0Ek2g5HjQUApDlLp7lVhi1QTnCfeA==
X-Received: by 2002:a4a:e5d7:: with SMTP id r23mr1348552oov.77.1641923552550; 
 Tue, 11 Jan 2022 09:52:32 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b000:9fdf:44f5:df0b:9fb0:d475])
 by smtp.gmail.com with ESMTPSA id t17sm2167865otc.17.2022.01.11.09.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 09:52:32 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Query Sensor
Date: Tue, 11 Jan 2022 10:52:31 -0700
Message-Id: <725B4491-C6A5-4B90-BE1A-B9EA6BE277AA@gmail.com>
References: <CAH2-KxBPXa6woa-9cFQ_Bn1Oqk3OYFKLPf2jpRU0mgRm443S1A@mail.gmail.com>
In-Reply-To: <CAH2-KxBPXa6woa-9cFQ_Bn1Oqk3OYFKLPf2jpRU0mgRm443S1A@mail.gmail.com>
To: Ed Tanous <edtanous@google.com>
X-Mailer: iPad Mail (19C56)
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

Ed,

So to be sure I understand, dbus-sensors implements the dbus services for ea=
ch sensor type, and the requests I made were serviced by one of these.

The interface is defined by yaml files in phosphor-dbus-interfaces.

phosphor-dbus- interfaces generates c++ base classes, and dbus-sensors proba=
bly have c++ classes inheriting from them.

These interfaces are not Redfish interfaces.

When WebUI fetches sensor values, is it using these interfaces, or is there a=
nother Redfish layer involved that translates the query? Or perhaps Redfish o=
nly matters for things like a PSU?

Mike


Sent from my iPad

> On Jan 11, 2022, at 10:22 AM, Ed Tanous <edtanous@google.com> wrote:
>=20
> =EF=BB=BFOn Tue, Jan 11, 2022 at 9:17 AM Mike Jones <proclivis@gmail.com> w=
rote:
>>=20
>> =EF=BB=BFThis is how to do it:
>>=20
>> dbus-send --system --print-reply \
>>=20
>> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>>=20
>> /xyz/openbmc_project/sensors/temperature/lm75temp \
>>=20
>> org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sensor.Val=
ue string:Value \
>>=20
>> double:
>>=20
>>=20
>> It is not clear to me why the second parameter string:Value
>>=20
>>=20
>> I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is the P=
roperty name, and properties have values, so the second parameter says get t=
he Value of a property whose name ends in .Value.\
>=20
> For better or worse, the term "Value" is overloaded in both the
> interface name, yz.openbmc_project.Sensor.Value, and the property name
> within the interface, Value.  That's why you see it twice in this
> case.  They are distinct things within the request that just happen to
> share a name.  Docs for the interface and property are here:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36a2e8=
cf96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Value.interface.yaml=
#L24
>=20
> Happy to see you figured it out.
>=20
>>=20
>>=20
>> To test that, I tried string:MaxValue, and that works.
>>=20
>>=20
>> I confirmed with this:
>>=20
>>=20
>> busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da90590708=
8a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sensors/temp=
erature/lm75temp
>>=20
>>=20
>> A very useful command.
>>=20
>>=20
>> Also useful:
>>=20
>>=20
>> dbus-send --system --print-reply \
>>=20
>> --dest=3Dxyz.openbmc_project.ObjectMapper /\
>>=20
>> xyz/openbmc_project/object_mapper \
>>=20
>> xyz.openbmc_project.ObjectMapper.GetSubTree \
>>=20
>> string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"
>>=20
>>=20
>>=20
>> Mike
>>=20
>>=20
>> Sent from my iPad
>>=20
>> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
>>=20
>> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.com>=
 wrote:
>>=20
>>=20
>> Hi,
>>=20
>>=20
>> I could not find an example of a sensor query in the docs. I assume somet=
hing like this:
>>=20
>>=20
>> dbus-send --system --print-reply \
>>=20
>>=20
>> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187a66b=
71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>>=20
>>=20
>> /xyz/openbmc_project/sensors/temperature/lm75temp
>>=20
>>=20
>> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Value \=

>>=20
>>=20
>> double:
>>=20
>>=20
>>=20
>> I don't have an example offhand, but the interface you're looking for
>> in the bolded area is
>> org.freedesktop.DBus.Properties.Get
>>=20
>> Stack overflow for essentially the same question with an example:
>> https://stackoverflow.com/questions/48648952/set-get-property-using-dbus-=
send
>>=20
>>=20
>> With the bold interface replaced with something correct.
>>=20
>>=20
>> Can some one give me an example, and a url about how to query properties?=

>>=20
>>=20
>> Mike
>>=20
>>=20
>> Sent from my iPad
