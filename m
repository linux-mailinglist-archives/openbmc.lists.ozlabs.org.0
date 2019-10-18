Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61323DBBA3
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 05:30:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vWl05lS7zDr7N
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 14:30:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Kd7pyv65"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vWk25f5xzDr4D
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 14:29:46 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id y72so2933059pfb.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 20:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NwH4s6O4lWl3qxWjJJJKEv9yjEUomeQQwc2ZZ5abDTI=;
 b=Kd7pyv65+G8miITfodOzN23vSFtZnqeSkTZpoEnVXBnMy6dRXqVh/qFVUjDXgv1htt
 5vLNJH9W60STvnUTIJzoJdZeJSnMfO2ZLSaUDaFol/ZY7R/vwNJNngxKXGui6zEFKr7D
 CF5Xxlo3EtTHbZyfcPYzYDjHZLl1KGydJTLVC618SJKabXGbTXLJ6tN8nbm45+UiC6dR
 CHxoF1ZjkHioSNgV5O6IkRFjiQYt7l2oelncvqbC2MI6co7iu6uKKsq0OImqo2bvsGl1
 k14G7NEUSHJhaGn8IQ89/6/c28euUeFc78gZUH56ddB5VBrubBpxIJJaqj9/qjnHCC3k
 amAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NwH4s6O4lWl3qxWjJJJKEv9yjEUomeQQwc2ZZ5abDTI=;
 b=cQIHOtuYRQco7KhwxQimx5sESTg6yaP7ApXv9o1sRfl2gXcpsaZ053UEFh+luFmXg8
 853FBNSPV9ZrqdT6TtLmsABlMVaY/8vB6fZ5u9P0RC7qXx/4uyRIB5OO+42vARZ14LCk
 MHmDXw/v+OWhqdkxjbh/TDUK6ZCz3RB1iKqlb38Bd7ox1/L/4D72CWxXvTy3RWPp0ozO
 HmkjIPvizdB5BvxGBmYo+zCNGeNKjox77eZMPs6xVYPJTYmthQN/Y1rhEKZif+f7pz6p
 S7R7BMKNEpuAg5nWGBVHc6sGj0E7vh7av9gB64Cfdg5duoUu19Ab/sxEyZxMEUqlxEIf
 nRnA==
X-Gm-Message-State: APjAAAVp93MkrOyd7R9yGOOoWIS8phNCJvNAMePfQzarkYrUvE8J9rPN
 yyS+dytsEkQ2D9qWtWDzOiIXZbYnuaV0zhs9tzIfkA==
X-Google-Smtp-Source: APXvYqxmMQqZt/8mDpUfpmQnl07JI29kLO/ka3FCiv9frBAH5siobdybQn+0BYeiPOw0mXn8mdOkkIUqf1wJSA+UQbw=
X-Received: by 2002:aa7:9885:: with SMTP id r5mr4036738pfl.136.1571369384230; 
 Thu, 17 Oct 2019 20:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
 <CAPnigKm2o5z3S3VxOev-gF8hCJNM0vS0fqMsA9pJE2i55bBVYA@mail.gmail.com>
In-Reply-To: <CAPnigKm2o5z3S3VxOev-gF8hCJNM0vS0fqMsA9pJE2i55bBVYA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 17 Oct 2019 20:29:32 -0700
Message-ID: <CAO=notyx+0TKHyJ-QksSp4bmYGHuPdhsDM9++EjtSjErM2xAiw@mail.gmail.com>
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

On Thu, Oct 17, 2019 at 7:46 PM William Kennington <wak@google.com> wrote:
>
> Looks like systemd doesn't even use an xml parser
> https://github.com/systemd/systemd/blob/cee97d57687e93e07a8ee36edf0e0d0f3317fccc/src/busctl/busctl-introspect.c

I'm thinking I'll just regex for what I seek in this case.  Since I
know the lead of the string, and how the surrounding bits should
appear.  I just need the interface name, a good regex use-case. :)

>
> On Thu, Oct 17, 2019 at 7:35 PM Patrick Venture <venture@google.com> wrote:
> >
> > With dbus-sensors, if I follow the Association property, i can find
> > the board that owns the sensor.  However, we have a use-case where we
> > want sensors to be able to have their own EntityId and EntityInstance
> > values configured via the json --
> >
> > This lead to three situations:
> > 1) sensor's board doesn't implement the Ipmi decoration
> > 2) sensor's board implements the Ipmi decoration
> > 3) sensor's board implements the Ipmi decoration, but the sensor has
> > override values in the sensor dbus object owned by EntityManager.
> >
> > The way I see to do it is to introspect on the dbus path and service,
> > and then search the list of interfaces to find one that starts
> > "xyz.openbmc_project.Configuration" and then search that interface for
> > an "EntityId" and "EntityInstance" property, and if present, read
> > them.
> >
> > So this leads me to this email:
> > 1) Has anyone already got an XML parser they like and has used it in
> > this way?  Just to save me from figuring out the exact way to wire it
> > up.
> >
> > busctl call xyz.openbmc_project.EntityManager
> > /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
> > org.freedesktop.DBus.Introspectable Introspect
> >
> > s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> > Introspection 1.0//EN\"\n\"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<node>\n
> > <interface name=\"org.freedesktop.DBus.Peer\">\n  <method
> > name=\"Ping\"/>\n  <method name=\"GetMachineId\">\n   <arg type=\"s\"
> > name=\"machine_uuid\" direction=\"out\"/>\n  </method>\n
> > </interface>\n <interface
> > name=\"org.freedesktop.DBus.Introspectable\">\n  <method
> > name=\"Introspect\">\n   <arg name=\"data\" type=\"s\"
> > direction=\"out\"/>\n  </method>\n </interface>\n <interface
> > name=\"org.freedesktop.DBus.Properties\">\n  <method name=\"Get\">\n
> > <arg name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > name=\"value\" direction=\"out\" type=\"v\"/>\n  </method>\n  <method
> > name=\"GetAll\">\n   <arg name=\"interface\" direction=\"in\"
> > type=\"s\"/>\n   <arg name=\"properties\" direction=\"out\"
> > type=\"a{sv}\"/>\n  </method>\n  <method name=\"Set\">\n   <arg
> > name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> > name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> > name=\"value\" direction=\"in\" type=\"v\"/>\n  </method>\n  <signal
> > name=\"PropertiesChanged\">\n   <arg type=\"s\" name=\"interface\"/>\n
> >   <arg type=\"a{sv}\" name=\"changed_properties\"/>\n   <arg
> > type=\"as\" name=\"invalidated_properties\"/>\n  </signal>\n
> > </interface>\n <interface
> > name=\"xyz.openbmc_project.Configuration.TMP421\">\n  <property
> > name=\"Address\" type=\"t\" access=\"read\">\n  </property>\n
> > <property name=\"Bus\" type=\"t\" access=\"read\">\n  </property>\n
> > <property name=\"Name\" type=\"s\" access=\"read\">\n  </property>\n
> > <property name=\"Type\" type=\"s\" access=\"read\">\n  </property>\n
> > </interface>\n</node>\n"
> >
> > It's pretty easy -- it takes no parameters and returns a string that I
> > feed into an XML parser, and then walk the nodes --> but has anyone
> > already done this? Maybe I can use their code as a snippet or if it's
> > in a common OpenBMC library?
> >
> > If nobody else has done this yet, I'll reply to this email with the
> > patch that does it :)  I'm definitely interested in suggestions on a
> > favored c++ XML parser.
> >
> > Thanks
> > Patrick
