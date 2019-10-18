Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB5DC8F8
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 17:43:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vr094X4YzF0ph
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 02:43:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="q4AOa0yb"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vqyt26Y3zF0WP
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 02:41:55 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id u12so3013817pls.12
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STBKqgt4AL+0GRjk2GgTfxGqNRbRMWYBga3ZOk/txyg=;
 b=q4AOa0yb6R1+8ABCQ/sHIxuNcnEJvS+/1EKYPWjOZtITqpcVeYffB+wBu8BsbI3zME
 ddLrxC2L4eTEkGTuB5L5Hb9Ur/ILhIKBDccEonRk3liaax6YpmfLMXnk6dk3Zs2f0sN2
 +1bKDp6Hx0HMXEUZlwftsZoZ4zK2FN/NAbikwQBEOb4bw25rD00NVtnWTOYwd6jA08zP
 or8mp/3oa+NZgV/FgkXZkVIw26FnbpT1i1oHWiR4azzXGctEKtKqiqCHDrGkDzZ/ou3D
 kHLZpnh0h1+GcVL6Vm6eIvur5hYZoicLD08unxlz/dfkzFkfKlKagw0qwsQotIxF4bnS
 J70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STBKqgt4AL+0GRjk2GgTfxGqNRbRMWYBga3ZOk/txyg=;
 b=fw97QJ07xmzRH7sAbX0x01H/6UQBW492duDD7Wx+7QeHfXS+MtBgMUtgzNfJbQmYGP
 Qz2DaX4KgrIytyyy//s3nYLaI6+VYTAp7cnleprQSnStq6WB8EMGZ3bfoT36Ve73rKrJ
 by/76gd/Rz0VFLdaxUElpZF5c60PkOAlDNoKcfxXarCxiqC3m1cBFQBZHaWIxNgTCWep
 xtR5LKb9xJtAJ4KgaaFPtEOe7qU9GACUTvceJlA8gb1x6BOihGPJHuDJccvBP6LyW578
 QJ/LCpUyXfX2X2tFnQ2LmP4Hmm2UgXWr/mX9HxlDbpbOs+j0gTgS9yZDK8VzgQd1me35
 U9DQ==
X-Gm-Message-State: APjAAAVHxxJJJj+V4w032HtMH6pOXgazQrguO07okQ11R66irqSdMA8v
 c6o4ZxAyJKMNGlbvEMltnWcinxGEH1IhkcZjQPnt6Q==
X-Google-Smtp-Source: APXvYqxRHUA3pcefCZx9GydZ8NUSw3YER/Eige37l4Tlh3OOkFvLna7xJG9pGrsN8g7I/iCAdt34pz2XMybQPHVTNDE=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr10418431plp.179.1571413312240; 
 Fri, 18 Oct 2019 08:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
 <CAPnigKm2o5z3S3VxOev-gF8hCJNM0vS0fqMsA9pJE2i55bBVYA@mail.gmail.com>
 <CAO=notyx+0TKHyJ-QksSp4bmYGHuPdhsDM9++EjtSjErM2xAiw@mail.gmail.com>
 <CAO=notztXi2ikTo_bz0iuarWj-Xn3gvJZmqGTfipnQnvCyPO3A@mail.gmail.com>
 <CAARXrtmNYKasEwa3=kGzHanZpFAtMHp=j3RwsQ4CvY0yPJd=0Q@mail.gmail.com>
In-Reply-To: <CAARXrtmNYKasEwa3=kGzHanZpFAtMHp=j3RwsQ4CvY0yPJd=0Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Oct 2019 08:41:40 -0700
Message-ID: <CAO=notyOTTsctTZDH3Cjk1dCzhfpF_n7-7nAZHwCWMFu4huvcg@mail.gmail.com>
Subject: Re: Parsing dbus introspect
To: Lei YU <mine260309@gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 10:55 PM Lei YU <mine260309@gmail.com> wrote:
>
> I think object mapper already does this for you.
> Just call GetSubtree and you get a list of objects and the interfaces
> they implement.
>
> E.g.
>  busctl call "xyz.openbmc_project.ObjectMapper"
> "/xyz/openbmc_project/object_mapper"
> "xyz.openbmc_project.ObjectMapper" GetSubTree sias
> /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
> 0 0

Thanks!  Although GetSubTree returned nothing, I checked the other methods:

busctl call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
GetObject sas /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
0

a{sas} 1 "xyz.openbmc_project.EntityManager" 1
"xyz.openbmc_project.Configuration.TMP421"

I didn't know the last parameter was optional -- so I have always used
it for a slightly different purpose.  This is excellent, thanks!

>
> On Fri, Oct 18, 2019 at 11:33 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Thu, Oct 17, 2019 at 8:29 PM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Thu, Oct 17, 2019 at 7:46 PM William Kennington <wak@google.com> wrote:
> > > >
> > > > Looks like systemd doesn't even use an xml parser
> > > > https://github.com/systemd/systemd/blob/cee97d57687e93e07a8ee36edf0e0d0f3317fccc/src/busctl/busctl-introspect.c
> > >
> > > I'm thinking I'll just regex for what I seek in this case.  Since I
> > > know the lead of the string, and how the surrounding bits should
> > > appear.  I just need the interface name, a good regex use-case. :)
> >
> > <interface name=\"xyz.openbmc_project.Configuration.TMP421\">
> >
> > >
> > > >
> > > > On Thu, Oct 17, 2019 at 7:35 PM Patrick Venture <venture@google.com> wrote:
> > > > >
> > > > > With dbus-sensors, if I follow the Association property, i can find
> > > > > the board that owns the sensor.  However, we have a use-case where we
> > > > > want sensors to be able to have their own EntityId and EntityInstance
> > > > > values configured via the json --
> > > > >
> > > > > This lead to three situations:
> > > > > 1) sensor's board doesn't implement the Ipmi decoration
> > > > > 2) sensor's board implements the Ipmi decoration
> > > > > 3) sensor's board implements the Ipmi decoration, but the sensor has
> > > > > override values in the sensor dbus object owned by EntityManager.
> > > > >
> > > > > The way I see to do it is to introspect on the dbus path and service,
> > > > > and then search the list of interfaces to find one that starts
> > > > > "xyz.openbmc_project.Configuration" and then search that interface for
> > > > > an "EntityId" and "EntityInstance" property, and if present, read
> > > > > them.
> > > > >
> > > > > So this leads me to this email:
> > > > > 1) Has anyone already got an XML parser they like and has used it in
> > > > > this way?  Just to save me from figuring out the exact way to wire it
> > > > > up.
> > > > >
> > > > > busctl call xyz.openbmc_project.EntityManager
> > > > > /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
> > > > > org.freedesktop.DBus.Introspectable Introspect
> > > > >
> > > > > s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> > > > > Introspection 1.0//EN\"\n\"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<node>\n
> > > > > <interface name=\"org.freedesktop.DBus.Peer\">\n  <method
> > > > > name=\"Ping\"/>\n  <method name=\"GetMachineId\">\n   <arg type=\"s\"
> > > > > name=\"machine_uuid\" direction=\"out\"/>\n  </method>\n
> > > > > </interface>\n <interface
> > > > > name=\"org.freedesktop.DBus.Introspectable\">\n  <method
> > > > > name=\"Introspect\">\n   <arg name=\"data\" type=\"s\"
> > > > > direction=\"out\"/>\n  </method>\n </interface>\n <interface
> > > > > name=\"org.freedesktop.DBus.Properties\">\n  <method name=\"Get\">\n
> > > > > <arg name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > > name=\"value\" direction=\"out\" type=\"v\"/>\n  </method>\n  <method
> > > > > name=\"GetAll\">\n   <arg name=\"interface\" direction=\"in\"
> > > > > type=\"s\"/>\n   <arg name=\"properties\" direction=\"out\"
> > > > > type=\"a{sv}\"/>\n  </method>\n  <method name=\"Set\">\n   <arg
> > > > > name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > > name=\"value\" direction=\"in\" type=\"v\"/>\n  </method>\n  <signal
> > > > > name=\"PropertiesChanged\">\n   <arg type=\"s\" name=\"interface\"/>\n
> > > > >   <arg type=\"a{sv}\" name=\"changed_properties\"/>\n   <arg
> > > > > type=\"as\" name=\"invalidated_properties\"/>\n  </signal>\n
> > > > > </interface>\n <interface
> > > > > name=\"xyz.openbmc_project.Configuration.TMP421\">\n  <property
> > > > > name=\"Address\" type=\"t\" access=\"read\">\n  </property>\n
> > > > > <property name=\"Bus\" type=\"t\" access=\"read\">\n  </property>\n
> > > > > <property name=\"Name\" type=\"s\" access=\"read\">\n  </property>\n
> > > > > <property name=\"Type\" type=\"s\" access=\"read\">\n  </property>\n
> > > > > </interface>\n</node>\n"
> > > > >
> > > > > It's pretty easy -- it takes no parameters and returns a string that I
> > > > > feed into an XML parser, and then walk the nodes --> but has anyone
> > > > > already done this? Maybe I can use their code as a snippet or if it's
> > > > > in a common OpenBMC library?
> > > > >
> > > > > If nobody else has done this yet, I'll reply to this email with the
> > > > > patch that does it :)  I'm definitely interested in suggestions on a
> > > > > favored c++ XML parser.
> > > > >
> > > > > Thanks
> > > > > Patrick
