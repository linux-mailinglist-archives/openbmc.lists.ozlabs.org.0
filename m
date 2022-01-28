Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A54A001D
	for <lists+openbmc@lfdr.de>; Fri, 28 Jan 2022 19:31:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlmHV10cNz3bc4
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 05:31:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jeZ5WIWW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jeZ5WIWW; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlmH52GwWz30Mn
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 05:30:38 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id bu18so13493189lfb.5
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jan 2022 10:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5eBhpZ3NGfkwtMwXR7E/upTmj2f/mb0q1gX5k0NSSZA=;
 b=jeZ5WIWWLyX8sJUodQxO3Oy8Xa2bXZZ4txvEAscHLuhZUxD9fWhdN6nM2wUGTkoSg8
 xsLSZcME2QoZsYP3t4+7mx8HdcXDnyRVjIUbqI9pcMTM6OjiBA5R3ZApWwd4KPwvOJOO
 gqbrEpMdsQOUEIxJwniAeLI/XeYACqyLDF2aA0r74brZ7A1bidFar7gqfkfpKCoHKD0F
 kg50XMpKlHLsrN1r7zogQwaJ+KcJZyluo0yU5tvHhyuccVLvgNbS9Jfq8wrhZEKhVHKc
 ZFvHqRf26LWVvpSJKUzmMvPVQbItXrtazeSSpFdXOQApRtlGZJnpZk02JzTmRdE73xGX
 0NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5eBhpZ3NGfkwtMwXR7E/upTmj2f/mb0q1gX5k0NSSZA=;
 b=clG/WN0ClbZa4a8bLZZI0RXlxZwOoW1mj6YZjDKHBHSENT/4ikYTxTlp5RajiPME0l
 lI9joMcvGo+umSdxW14KTakYJ/FRjqvAcDlqDq6AivO4kHfQC/XtioKaO7DI4w8+W0jn
 W1ErJUOl/7t55sLbWtJF9T4Ez8xFB/O8A+jIrDRvF6fOz7wKe2QeNVh6RnB424HbkPlf
 0nc/cv8wJ7FsI79/aVf0YO15t3+N/LOLVlUVnCHICatlDkZLuKLq0Z3xpVhDrviI9St9
 n8pZkAeuE8NLqkarHaHoujAfT9EXEtxV09xQxj8QvW1yz08Cocv67wkEfr6lOmg3QrvX
 2SUw==
X-Gm-Message-State: AOAM530go/a43IBoskItP3oi2HNTqLrOx73l1Tr+dS3kWW2EGytM4JJx
 tPForJAcbLoF0DJddQW4e+FN2OuVMmOErmV46d0jEg==
X-Google-Smtp-Source: ABdhPJxpWPJzny/0CYByBLfliWZYVr21rLZFEgLzZPUKS8PHcfYPEqFcIF4JS7104rwwKBpxk3i5H8ARhDM45Gb2ctE=
X-Received: by 2002:a05:6512:3f8e:: with SMTP id
 x14mr7162393lfa.538.1643394631676; 
 Fri, 28 Jan 2022 10:30:31 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX82gK7O-qNrFJxi3q70ejdXJLULCPxBi=8+jtZvZNj8t8w@mail.gmail.com>
 <AB057B30-4E65-4958-BDB9-0EDF4771C5B7@gmail.com>
In-Reply-To: <AB057B30-4E65-4958-BDB9-0EDF4771C5B7@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 28 Jan 2022 10:30:20 -0800
Message-ID: <CACWQX83CDLLYbXqAnbkpHL8WStQWnezkZgPew_H2W1psiCKayA@mail.gmail.com>
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 13, 2022 at 1:16 PM Mike Jones <proclivis@gmail.com> wrote:
>
> Ed,
>
> What translates the redfish query into a dbus query?

The code in bmcweb.  Look in the redfish-core folder for the redfish
specific bits.

>
> Mike
>
> Sent from my iPad
>
> On Jan 11, 2022, at 7:04 PM, Ed Tanous <ed@tanous.net> wrote:
>
> =EF=BB=BF
>
>
> On Tue, Jan 11, 2022 at 9:53 AM Mike Jones <proclivis@gmail.com> wrote:
>>
>> Ed,
>>
>> So to be sure I understand, dbus-sensors implements the dbus services fo=
r each sensor type, and the requests I made were serviced by one of these.
>
>
> Correct.
>
>>
>>
>> The interface is defined by yaml files in phosphor-dbus-interfaces.
>
>
> Yep.
>
>>
>>
>> phosphor-dbus- interfaces generates c++ base classes, and dbus-sensors p=
robably have c++ classes inheriting from them.
>
>
>
> For various technical and social reasons which I=E2=80=99ve detailed in m=
ail to this list in the past, dbus-sensors doesn=E2=80=99t depend directly =
on phosphor-dbus-interfaces, nor rely on the generated code. It instead gen=
erates code from c++ template expansion in sdbusplus.
>
>>
>>
>> These interfaces are not Redfish interfaces.
>
>
> Correct.
>
>>
>>
>> When WebUI fetches sensor values, is it using these interfaces, or is th=
ere another Redfish layer involved that translates the query? Or perhaps Re=
dfish only matters for things like a PSU?
>
>
>
> Depends on which webui you=E2=80=99re talking about, there are two.
>
> Phosphor-webui (ie the =E2=80=9Cold=E2=80=9D one) goes directly to dbus t=
hrough the rest-dbus abstraction in bmcweb.  This was very good for initial=
 prototyping (aside from a port to c++, the code largely hasn=E2=80=99t cha=
nged since it was written) but not great at keeping a consistent or standar=
dized API.
>
> Webui-vue (ie, the new one) relies on Redfish directly, which in-effect m=
akes a very nice Redfish gui, and minimizes the chance that the dbus interf=
aces are correct, but redfish is broken.  It also keeps us standard complia=
nt, so in theory webui-vue could be used on another non-openbmc project in =
the future.
>
> Ed
>
>>
>>
>> Mike
>>
>>
>> Sent from my iPad
>>
>> > On Jan 11, 2022, at 10:22 AM, Ed Tanous <edtanous@google.com> wrote:
>> >
>> > =EF=BB=BFOn Tue, Jan 11, 2022 at 9:17 AM Mike Jones <proclivis@gmail.c=
om> wrote:
>> >>
>> >> =EF=BB=BFThis is how to do it:
>> >>
>> >> dbus-send --system --print-reply \
>> >>
>> >> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187=
a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>> >>
>> >> /xyz/openbmc_project/sensors/temperature/lm75temp \
>> >>
>> >> org.freedesktop.DBus.Properties.Get string:xyz.openbmc_project.Sensor=
.Value string:Value \
>> >>
>> >> double:
>> >>
>> >>
>> >> It is not clear to me why the second parameter string:Value
>> >>
>> >>
>> >> I guessed on that and it works. Perhaps xyz=E2=80=A6Sensor.Value is t=
he Property name, and properties have values, so the second parameter says =
get the Value of a property whose name ends in .Value.\
>> >
>> > For better or worse, the term "Value" is overloaded in both the
>> > interface name, yz.openbmc_project.Sensor.Value, and the property name
>> > within the interface, Value.  That's why you see it twice in this
>> > case.  They are distinct things within the request that just happen to
>> > share a name.  Docs for the interface and property are here:
>> > https://github.com/openbmc/phosphor-dbus-interfaces/blob/e0674c894ed36=
a2e8cf96207907a531d2f514054/yaml/xyz/openbmc_project/Sensor/Value.interface=
.yaml#L24
>> >
>> > Happy to see you figured it out.
>> >
>> >>
>> >>
>> >> To test that, I tried string:MaxValue, and that works.
>> >>
>> >>
>> >> I confirmed with this:
>> >>
>> >>
>> >> busctl introspect xyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da9059=
07088a187a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 /xyz/openbmc_project/sensors=
/temperature/lm75temp
>> >>
>> >>
>> >> A very useful command.
>> >>
>> >>
>> >> Also useful:
>> >>
>> >>
>> >> dbus-send --system --print-reply \
>> >>
>> >> --dest=3Dxyz.openbmc_project.ObjectMapper /\
>> >>
>> >> xyz/openbmc_project/object_mapper \
>> >>
>> >> xyz.openbmc_project.ObjectMapper.GetSubTree \
>> >>
>> >> string:"/" int32:0 array:string:"xyz.openbmc_project.Sensor.Value"
>> >>
>> >>
>> >>
>> >> Mike
>> >>
>> >>
>> >> Sent from my iPad
>> >>
>> >> On Jan 10, 2022, at 4:50 PM, Ed Tanous <edtanous@google.com> wrote:
>> >>
>> >> =EF=BB=BFOn Mon, Jan 10, 2022 at 3:47 PM Mike Jones <proclivis@gmail.=
com> wrote:
>> >>
>> >>
>> >> Hi,
>> >>
>> >>
>> >> I could not find an example of a sensor query in the docs. I assume s=
omething like this:
>> >>
>> >>
>> >> dbus-send --system --print-reply \
>> >>
>> >>
>> >> --dest=3Dxyz.openbmc_project.Hwmon-5a446562b1a2e55ef11da905907088a187=
a66b71eb7a1f29187594c05bb8fd9a.Hwmon1 \
>> >>
>> >>
>> >> /xyz/openbmc_project/sensors/temperature/lm75temp
>> >>
>> >>
>> >> xyz.openbmc_project.Sensor.Property.Get xyz.openbmc_project.Sensor.Va=
lue \
>> >>
>> >>
>> >> double:
>> >>
>> >>
>> >>
>> >> I don't have an example offhand, but the interface you're looking for
>> >> in the bolded area is
>> >> org.freedesktop.DBus.Properties.Get
>> >>
>> >> Stack overflow for essentially the same question with an example:
>> >> https://stackoverflow.com/questions/48648952/set-get-property-using-d=
bus-send
>> >>
>> >>
>> >> With the bold interface replaced with something correct.
>> >>
>> >>
>> >> Can some one give me an example, and a url about how to query propert=
ies?
>> >>
>> >>
>> >> Mike
>> >>
>> >>
>> >> Sent from my iPad
>
> --
> -Ed
