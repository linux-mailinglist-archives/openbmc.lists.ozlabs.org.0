Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9662DBB7C
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 04:47:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vVnW11pVzDqbw
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 13:47:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Sf3lpGfU"; 
 dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vVmp0t9KzDqbw
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 13:47:04 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id y3so4596897ljj.6
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 19:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IwvXJLieouQ6wmBOjE+wITR03V2QLFEITm/U428vzKM=;
 b=Sf3lpGfU03l5/Gw7dlWv9LhXDl4q2DuxzM2K1WH1MswoBo6kBBG/IPnFFTw3oUZVL4
 oRnj7YOkANfPvK2YU75TnN9AfpnzXFiI2RVGX6BG0Mr/RiMLeSb+1EsX1N0iKLfxsmx1
 dbpIsyjposvxrG28va6ow/C69fnMeUTds0ba8B12nLE9qQ+1H8+Uof64xHQLQi2Gv0+i
 mqlS1Tihbvb9gNCFSqGVVQN1hJUfbCVG4jqbnMum2PleyTK42GPA33JTG2wy9T339o/n
 EbIj18C5DGsU68uipRJG3Tc5xCs6qhCzxls/hHbIHyMWnT29W3SoSJXsuGWV/Av6aBVq
 OILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IwvXJLieouQ6wmBOjE+wITR03V2QLFEITm/U428vzKM=;
 b=qqCEiDxngOnEd76WMMiqEWKyxjuA/9SVvaGLx205EZ14htNIRDRUv6tFG0nZIST5No
 kcWg141snWLU4V9/4YPrBU6f+iqq0YCUoYL/fp52YeCm1uyh2jZrtrtIcsKJBfL5q3kL
 BUBMgNX+7KIFnySk2O326a3DMaqfyXsP0VNWLAg0aOnk3rTWD5LftBpzlK9ti2dVYVZS
 2mqqTktepbk1NPThwRt3RtKpXgBt+Spb3fu2/2ObDpN8xb9bn2fR2goAwSz7ZtiWwZMO
 Z52xQqoOCIOQO1hXrwYcKHzPpYVlKcDtt0bVRapmTpBLzWVzy50qPY1PCjrfZd1pvExI
 ea6w==
X-Gm-Message-State: APjAAAXJMFjzisE7p9oY7smDUZg5VTQSmO0DWoxVmSoV3Zq2M5w+dCFv
 dkAQ7Dm6sJSmolIKVsJfgyB7sgYb47kgXgFod9ZeFw==
X-Google-Smtp-Source: APXvYqxs0xcL+YSi09udh6mPc/w1+ghWETEbfjC15P5MIo/jxZKpj/VZckuIaf7IiFQCuIAy+hiPRbfw52ZYY2Ii/0o=
X-Received: by 2002:a2e:8417:: with SMTP id z23mr4308989ljg.28.1571366816643; 
 Thu, 17 Oct 2019 19:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
In-Reply-To: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Thu, 17 Oct 2019 19:46:45 -0700
Message-ID: <CAPnigKm2o5z3S3VxOev-gF8hCJNM0vS0fqMsA9pJE2i55bBVYA@mail.gmail.com>
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Looks like systemd doesn't even use an xml parser
https://github.com/systemd/systemd/blob/cee97d57687e93e07a8ee36edf0e0d0f3317fccc/src/busctl/busctl-introspect.c

On Thu, Oct 17, 2019 at 7:35 PM Patrick Venture <venture@google.com> wrote:
>
> With dbus-sensors, if I follow the Association property, i can find
> the board that owns the sensor.  However, we have a use-case where we
> want sensors to be able to have their own EntityId and EntityInstance
> values configured via the json --
>
> This lead to three situations:
> 1) sensor's board doesn't implement the Ipmi decoration
> 2) sensor's board implements the Ipmi decoration
> 3) sensor's board implements the Ipmi decoration, but the sensor has
> override values in the sensor dbus object owned by EntityManager.
>
> The way I see to do it is to introspect on the dbus path and service,
> and then search the list of interfaces to find one that starts
> "xyz.openbmc_project.Configuration" and then search that interface for
> an "EntityId" and "EntityInstance" property, and if present, read
> them.
>
> So this leads me to this email:
> 1) Has anyone already got an XML parser they like and has used it in
> this way?  Just to save me from figuring out the exact way to wire it
> up.
>
> busctl call xyz.openbmc_project.EntityManager
> /xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
> org.freedesktop.DBus.Introspectable Introspect
>
> s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> Introspection 1.0//EN\"\n\"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<node>\n
> <interface name=\"org.freedesktop.DBus.Peer\">\n  <method
> name=\"Ping\"/>\n  <method name=\"GetMachineId\">\n   <arg type=\"s\"
> name=\"machine_uuid\" direction=\"out\"/>\n  </method>\n
> </interface>\n <interface
> name=\"org.freedesktop.DBus.Introspectable\">\n  <method
> name=\"Introspect\">\n   <arg name=\"data\" type=\"s\"
> direction=\"out\"/>\n  </method>\n </interface>\n <interface
> name=\"org.freedesktop.DBus.Properties\">\n  <method name=\"Get\">\n
> <arg name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> name=\"value\" direction=\"out\" type=\"v\"/>\n  </method>\n  <method
> name=\"GetAll\">\n   <arg name=\"interface\" direction=\"in\"
> type=\"s\"/>\n   <arg name=\"properties\" direction=\"out\"
> type=\"a{sv}\"/>\n  </method>\n  <method name=\"Set\">\n   <arg
> name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
> name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
> name=\"value\" direction=\"in\" type=\"v\"/>\n  </method>\n  <signal
> name=\"PropertiesChanged\">\n   <arg type=\"s\" name=\"interface\"/>\n
>   <arg type=\"a{sv}\" name=\"changed_properties\"/>\n   <arg
> type=\"as\" name=\"invalidated_properties\"/>\n  </signal>\n
> </interface>\n <interface
> name=\"xyz.openbmc_project.Configuration.TMP421\">\n  <property
> name=\"Address\" type=\"t\" access=\"read\">\n  </property>\n
> <property name=\"Bus\" type=\"t\" access=\"read\">\n  </property>\n
> <property name=\"Name\" type=\"s\" access=\"read\">\n  </property>\n
> <property name=\"Type\" type=\"s\" access=\"read\">\n  </property>\n
> </interface>\n</node>\n"
>
> It's pretty easy -- it takes no parameters and returns a string that I
> feed into an XML parser, and then walk the nodes --> but has anyone
> already done this? Maybe I can use their code as a snippet or if it's
> in a common OpenBMC library?
>
> If nobody else has done this yet, I'll reply to this email with the
> patch that does it :)  I'm definitely interested in suggestions on a
> favored c++ XML parser.
>
> Thanks
> Patrick
