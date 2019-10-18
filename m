Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08816DBD4C
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 07:56:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vZzB6LgVzDrGG
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 16:56:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+UDlwkJ"; 
 dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vZxt5n8PzDrMh
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 16:55:14 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id n26so6001577ioj.8
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 22:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GCt/Pz8gHyAkbUKmfr2CAP3B164xR+X4l5t2pKoUUbo=;
 b=c+UDlwkJMr4xV4T3x1baOvpVVAw5SpoqMIvrBC9NvocjswiV07iCpJovo/6+nFZDkI
 hEQMhXHhEYMGeL3RRczmFZLbXdIMZbTBjXAuD1J0XvGzzEtzhPidLI5yrw9zirqJpQ3L
 zcsC0dD/Y/hTYrGYiCRWZLk4zFwHzOv3DD+ndSb17J4VVjch7P/T0PF84vX+Bpl2nVxn
 9/0YBUEppVsTaaBHt7Orpy/sMuCT9QvePkhQylS4MUpNEvvgW3WcWw7p83+MnJY6yAm3
 bnFvm5GouaFODdsSrsJKLz3GUMf0WtxKSfRBUVLS6HX9jA/tzzuKYIVJhS3ZJnnqqdKE
 VaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GCt/Pz8gHyAkbUKmfr2CAP3B164xR+X4l5t2pKoUUbo=;
 b=esuAFngUEqXDmK47nyDwv/P6si3JGS1PTnJjlLnZIFkP6fpK91SJHH/BBAnbhw4ZXi
 BDf3dQ//j9i9L9bMtVZUQhi8x0AwrBpr4HO/DJjAPJHJukNzqkvNhDPE1MYxyVZW9XzX
 DdKA7+wGlIXtrDfxi/UyEn/S56jn2E8lbcJYmuIWVX6pCEDM9VaAdjSNKH1x3RYNxUYV
 RiOWnJlyTXeplgub16ZXC6nVVocMS+83+JspHqiTPEfoDDdwJy0Mz1t6udzsy6MnRQ5P
 RnkZJ4cDhgtbwB3P3u1G9s8KUK1tHhEK/CotNrCF1JkbXZtjH8kUonove1n4FCq4AXmL
 OzrA==
X-Gm-Message-State: APjAAAWWiCvs5OOS4A9TFZc+FXDuwRJSaC4mVT/yGMqiNxPufciV6f2C
 iLd0JQ5HxQtWY0WkQrCeRcFzqYoyILeaYQBHQiY=
X-Google-Smtp-Source: APXvYqwCsskHnLoPOdKc3hPERd91Qzshfk7cJCTtjKa/ZAGIfPe/rO2Oz+fVrfGK+zVrk7akvHwolxVPtiNu91TtZFU=
X-Received: by 2002:a6b:7417:: with SMTP id s23mr2296795iog.221.1571378112201; 
 Thu, 17 Oct 2019 22:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
 <CAPnigKm2o5z3S3VxOev-gF8hCJNM0vS0fqMsA9pJE2i55bBVYA@mail.gmail.com>
 <CAO=notyx+0TKHyJ-QksSp4bmYGHuPdhsDM9++EjtSjErM2xAiw@mail.gmail.com>
 <CAO=notztXi2ikTo_bz0iuarWj-Xn3gvJZmqGTfipnQnvCyPO3A@mail.gmail.com>
In-Reply-To: <CAO=notztXi2ikTo_bz0iuarWj-Xn3gvJZmqGTfipnQnvCyPO3A@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 18 Oct 2019 13:55:01 +0800
Message-ID: <CAARXrtmNYKasEwa3=kGzHanZpFAtMHp=j3RwsQ4CvY0yPJd=0Q@mail.gmail.com>
Subject: Re: Parsing dbus introspect
To: Patrick Venture <venture@google.com>
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

I think object mapper already does this for you.
Just call GetSubtree and you get a list of objects and the interfaces
they implement.

E.g.
 busctl call "xyz.openbmc_project.ObjectMapper"
"/xyz/openbmc_project/object_mapper"
"xyz.openbmc_project.ObjectMapper" GetSubTree sias
/xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
0 0

On Fri, Oct 18, 2019 at 11:33 AM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Oct 17, 2019 at 8:29 PM Patrick Venture <venture@google.com> wrote:
> >
> > On Thu, Oct 17, 2019 at 7:46 PM William Kennington <wak@google.com> wrote:
> > >
> > > Looks like systemd doesn't even use an xml parser
> > > https://github.com/systemd/systemd/blob/cee97d57687e93e07a8ee36edf0e0d0f3317fccc/src/busctl/busctl-introspect.c
> >
> > I'm thinking I'll just regex for what I seek in this case.  Since I
> > know the lead of the string, and how the surrounding bits should
> > appear.  I just need the interface name, a good regex use-case. :)
>
> <interface name=\"xyz.openbmc_project.Configuration.TMP421\">
>
> >
> > >
> > > On Thu, Oct 17, 2019 at 7:35 PM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > With dbus-sensors, if I follow the Association property, i can find
> > > > the board that owns the sensor.  However, we have a use-case where we
> > > > want sensors to be able to have their own EntityId and EntityInstance
> > > > values configured via the json --
> > > >
> > > > This lead to three situations:
> > > > 1) sensor's board doesn't implement the Ipmi decoration
> > > > 2) sensor's board implements the Ipmi decoration
> > > > 3) sensor's board implements the Ipmi decoration, but the sensor has
> > > > override values in the sensor dbus object owned by EntityManager.
> > > >
> > > > The way I see to do it is to introspect on the dbus path and service,
> > > > and then search the list of interfaces to find one that starts
> > > > "xyz.openbmc_project.Configuration" and then search that interface for
> > > > an "EntityId" and "EntityInstance" property, and if present, read
> > > > them.
> > > >
> > > > So this leads me to this email:
> > > > 1) Has anyone already got an XML parser they like and has used it in
> > > > this way?  Just to save me from figuring out the exact way to wire it
> > > > up.
> > > >
> > > > busctl call xyz.openbmc_project.EntityManager
> > > > /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
> > > > org.freedesktop.DBus.Introspectable Introspect
> > > >
> > > > s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> > > > Introspection 1.0//EN\"\n\"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<node>\n
> > > > <interface name=\"org.freedesktop.DBus.Peer\">\n  <method
> > > > name=\"Ping\"/>\n  <method name=\"GetMachineId\">\n   <arg type=\"s\"
> > > > name=\"machine_uuid\" direction=\"out\"/>\n  </method>\n
> > > > </interface>\n <interface
> > > > name=\"org.freedesktop.DBus.Introspectable\">\n  <method
> > > > name=\"Introspect\">\n   <arg name=\"data\" type=\"s\"
> > > > direction=\"out\"/>\n  </method>\n </interface>\n <interface
> > > > name=\"org.freedesktop.DBus.Properties\">\n  <method name=\"Get\">\n
> > > > <arg name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > name=\"value\" direction=\"out\" type=\"v\"/>\n  </method>\n  <method
> > > > name=\"GetAll\">\n   <arg name=\"interface\" direction=\"in\"
> > > > type=\"s\"/>\n   <arg name=\"properties\" direction=\"out\"
> > > > type=\"a{sv}\"/>\n  </method>\n  <method name=\"Set\">\n   <arg
> > > > name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > > > name=\"value\" direction=\"in\" type=\"v\"/>\n  </method>\n  <signal
> > > > name=\"PropertiesChanged\">\n   <arg type=\"s\" name=\"interface\"/>\n
> > > >   <arg type=\"a{sv}\" name=\"changed_properties\"/>\n   <arg
> > > > type=\"as\" name=\"invalidated_properties\"/>\n  </signal>\n
> > > > </interface>\n <interface
> > > > name=\"xyz.openbmc_project.Configuration.TMP421\">\n  <property
> > > > name=\"Address\" type=\"t\" access=\"read\">\n  </property>\n
> > > > <property name=\"Bus\" type=\"t\" access=\"read\">\n  </property>\n
> > > > <property name=\"Name\" type=\"s\" access=\"read\">\n  </property>\n
> > > > <property name=\"Type\" type=\"s\" access=\"read\">\n  </property>\n
> > > > </interface>\n</node>\n"
> > > >
> > > > It's pretty easy -- it takes no parameters and returns a string that I
> > > > feed into an XML parser, and then walk the nodes --> but has anyone
> > > > already done this? Maybe I can use their code as a snippet or if it's
> > > > in a common OpenBMC library?
> > > >
> > > > If nobody else has done this yet, I'll reply to this email with the
> > > > patch that does it :)  I'm definitely interested in suggestions on a
> > > > favored c++ XML parser.
> > > >
> > > > Thanks
> > > > Patrick
