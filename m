Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA66DBBA4
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 05:32:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vWnH4qLPzDr7L
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 14:32:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eYjeLzCa"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vWlD421rzDr45
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 14:30:48 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id y72so2934577pfb.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 20:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdkjBsCNjG/wcF8Iqq3TiUxz91VNvXFRJq6e4JnchA8=;
 b=eYjeLzCaIjKl9zAdJ1UAv9Tfl2GevGqbDO2nBm1jAANPKrONABuwh4f9sIVUSS/dJ0
 eukvgjPftCP8XIbr6gAflt+4YQHlqgLBcnoY2Mn6yN/r+42NHQMl9WcQYBxae7XDF+eG
 3EwhazXhOJGzAIEwTniTgD++WBqTWt/RsUYomaYqXNSAi9IllxZb27wvUJx13Gje2LFl
 QvLF6g9XtgRb4FB6Sh9CxveIFB4YLbBVfh69/Z7NapdTKMtUkc2SVnTtRryCCo2siNcJ
 NGBN9YAUgJdba/bZuxD9o4BFfi+rvpy0WXCu22N57a18wRWS/My+FvZ+GtEXkRx9zXb6
 Ts9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdkjBsCNjG/wcF8Iqq3TiUxz91VNvXFRJq6e4JnchA8=;
 b=KgcSpcRcBO8A4XOTIdg2AsVr/ur3yKG4c9qWWX5Ms6RfuhYWqQQSbi8j3WWdIHrQBm
 5AAx70jwyI/OYGuKGFSD7VoXJGw+GExL4Iwachu3Lxh8ScbXnRqi7Yr9ZzEU5u1lUQrf
 pcdW8ImnQ/hzpQMOKQLY7bu+kfW3CbT1ivTouSpmouz4EPsh8pzz3S/qo00f41RBlK3Q
 rH183pDeisyOetIBeoE2mpopEhNRMHBoFBKBjQVsmSvZVZVb4a+yLvTFSsjW4saL7MCZ
 2HxtajfbF0eNQc+1Gr7mVibw2A8NCy8H86W0kXABO+Aap9WAhJ7PeXFHi2uzHtwxS9lf
 ITUQ==
X-Gm-Message-State: APjAAAU/SZcM9sKmpYNK8IvOKaAjZpb8jEJzE7KBJWTuW/G3d2WDLNS4
 +g5ExK+/+Lvkhe6Iggg3G0VhbUMCWh6l9ljmdx3DQg==
X-Google-Smtp-Source: APXvYqystuO0Rrti0wv6kb4MTBzJ2OxzBC1tSH+4SJUa8rKFTZDmmeax8Wryj7yXUz5Qr0Gf9i38MA9baIU+UmPBaB8=
X-Received: by 2002:aa7:9a0c:: with SMTP id w12mr3979142pfj.81.1571369445713; 
 Thu, 17 Oct 2019 20:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
 <CAPnigKm2o5z3S3VxOev-gF8hCJNM0vS0fqMsA9pJE2i55bBVYA@mail.gmail.com>
 <CAO=notyx+0TKHyJ-QksSp4bmYGHuPdhsDM9++EjtSjErM2xAiw@mail.gmail.com>
In-Reply-To: <CAO=notyx+0TKHyJ-QksSp4bmYGHuPdhsDM9++EjtSjErM2xAiw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 17 Oct 2019 20:30:34 -0700
Message-ID: <CAO=notztXi2ikTo_bz0iuarWj-Xn3gvJZmqGTfipnQnvCyPO3A@mail.gmail.com>
Subject: Re: Parsing dbus introspect
To: William Kennington <wak@google.com>
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 8:29 PM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Oct 17, 2019 at 7:46 PM William Kennington <wak@google.com> wrote:
> >
> > Looks like systemd doesn't even use an xml parser
> > https://github.com/systemd/systemd/blob/cee97d57687e93e07a8ee36edf0e0d0f3317fccc/src/busctl/busctl-introspect.c
>
> I'm thinking I'll just regex for what I seek in this case.  Since I
> know the lead of the string, and how the surrounding bits should
> appear.  I just need the interface name, a good regex use-case. :)

<interface name=\"xyz.openbmc_project.Configuration.TMP421\">

>
> >
> > On Thu, Oct 17, 2019 at 7:35 PM Patrick Venture <venture@google.com> wrote:
> > >
> > > With dbus-sensors, if I follow the Association property, i can find
> > > the board that owns the sensor.  However, we have a use-case where we
> > > want sensors to be able to have their own EntityId and EntityInstance
> > > values configured via the json --
> > >
> > > This lead to three situations:
> > > 1) sensor's board doesn't implement the Ipmi decoration
> > > 2) sensor's board implements the Ipmi decoration
> > > 3) sensor's board implements the Ipmi decoration, but the sensor has
> > > override values in the sensor dbus object owned by EntityManager.
> > >
> > > The way I see to do it is to introspect on the dbus path and service,
> > > and then search the list of interfaces to find one that starts
> > > "xyz.openbmc_project.Configuration" and then search that interface for
> > > an "EntityId" and "EntityInstance" property, and if present, read
> > > them.
> > >
> > > So this leads me to this email:
> > > 1) Has anyone already got an XML parser they like and has used it in
> > > this way?  Just to save me from figuring out the exact way to wire it
> > > up.
> > >
> > > busctl call xyz.openbmc_project.EntityManager
> > > /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
> > > org.freedesktop.DBus.Introspectable Introspect
> > >
> > > s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> > > Introspection 1.0//EN\"\n\"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<node>\n
> > > <interface name=\"org.freedesktop.DBus.Peer\">\n  <method
> > > name=\"Ping\"/>\n  <method name=\"GetMachineId\">\n   <arg type=\"s\"
> > > name=\"machine_uuid\" direction=\"out\"/>\n  </method>\n
> > > </interface>\n <interface
> > > name=\"org.freedesktop.DBus.Introspectable\">\n  <method
> > > name=\"Introspect\">\n   <arg name=\"data\" type=\"s\"
> > > direction=\"out\"/>\n  </method>\n </interface>\n <interface
> > > name=\"org.freedesktop.DBus.Properties\">\n  <method name=\"Get\">\n
> > > <arg name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > > name=\"value\" direction=\"out\" type=\"v\"/>\n  </method>\n  <method
> > > name=\"GetAll\">\n   <arg name=\"interface\" direction=\"in\"
> > > type=\"s\"/>\n   <arg name=\"properties\" direction=\"out\"
> > > type=\"a{sv}\"/>\n  </method>\n  <method name=\"Set\">\n   <arg
> > > name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > > name=\"value\" direction=\"in\" type=\"v\"/>\n  </method>\n  <signal
> > > name=\"PropertiesChanged\">\n   <arg type=\"s\" name=\"interface\"/>\n
> > >   <arg type=\"a{sv}\" name=\"changed_properties\"/>\n   <arg
> > > type=\"as\" name=\"invalidated_properties\"/>\n  </signal>\n
> > > </interface>\n <interface
> > > name=\"xyz.openbmc_project.Configuration.TMP421\">\n  <property
> > > name=\"Address\" type=\"t\" access=\"read\">\n  </property>\n
> > > <property name=\"Bus\" type=\"t\" access=\"read\">\n  </property>\n
> > > <property name=\"Name\" type=\"s\" access=\"read\">\n  </property>\n
> > > <property name=\"Type\" type=\"s\" access=\"read\">\n  </property>\n
> > > </interface>\n</node>\n"
> > >
> > > It's pretty easy -- it takes no parameters and returns a string that I
> > > feed into an XML parser, and then walk the nodes --> but has anyone
> > > already done this? Maybe I can use their code as a snippet or if it's
> > > in a common OpenBMC library?
> > >
> > > If nobody else has done this yet, I'll reply to this email with the
> > > patch that does it :)  I'm definitely interested in suggestions on a
> > > favored c++ XML parser.
> > >
> > > Thanks
> > > Patrick
