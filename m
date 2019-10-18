Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F142DBB76
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 04:35:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vVWH353dzDr0x
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 13:35:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qzf2n7fH"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vVVV5j1pzDqgX
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 13:34:41 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id h195so2872309pfe.5
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 19:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=azgnOu1tIF7GAJ2fdzvQWxg1kLVZWPkTXkI6XYA0fzE=;
 b=Qzf2n7fHfjeNekWBKzuXGEmq/nC8Od+kUxl4iXaPwQfC8wp+AePUA3lnKVKVf3Fdxf
 ucpeXuPzFV0UFMED0NVSqwRh3/sOqPTCCOW8bpyrNoLFkkMYDmZY9mmBDw5rD0GzX5DA
 B66manMuvh/sEOilvWtCOSyw8EHfP6vKDcfST9LXosEwHqIGyfkpomnITFhtLE6y0iHj
 oNEs/Rb1dyVJKsc0XzGiktZTsWoK4i49zTk8WLf/rE3/EcVkMUzs4x0Hu90ZblGZ9/b7
 OSH836KyYqml+v0nkaH96+4LNpv3G/fcTfVXFlnxZLaohT7VPP9wDqZtzlltYPYMHzBd
 6wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=azgnOu1tIF7GAJ2fdzvQWxg1kLVZWPkTXkI6XYA0fzE=;
 b=goIgr8bak4KjfnwvSa8BeDdJMCWYrL04EP8gh1GRmp660tGfT788ULBVzTz1cB6xU9
 S0zuFSfxG3iQnuyT9fjTk/mmovPH4QO7aWQttrthtNP0EufcHW/m3ZdFSTQQC8NMIVIq
 JykXySEkiEiJBub3AWbpwrjyFCU2RlCnxaPTNNR8BihoaJzB5rWcFEDzUD8y5I845zaZ
 xiVOF90bPUXuQCgFucJj9/SMzZXQDidZP083ogpc95kgrGbQ1dbSsJyWAa6QvVeKhYMs
 P1mwbzyxL8SPCnSoEPr4OTCAmRE/jbJ0WKqNe2vxasIb/5TILLHCleo9wck+JqNxdufL
 08sg==
X-Gm-Message-State: APjAAAWGtA0g1foYilitqBcM8+6KRoc2DbrXV9fkGvCvHRXZ6+YR+AR2
 +4TEli4j8M0fryzh2oXOhEdT37dh/ofibq3K91PdmQ==
X-Google-Smtp-Source: APXvYqwY0RR1N3Bg2Nj12y3NaLcigKjfEsmPQ+7eL4DBtnhyOYzx5LwZXwIbAbtSlda6OSuTVL/AUozNuHFfx1AnKgo=
X-Received: by 2002:aa7:9a0c:: with SMTP id w12mr3752344pfj.81.1571366077698; 
 Thu, 17 Oct 2019 19:34:37 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 17 Oct 2019 19:34:26 -0700
Message-ID: <CAO=notz74hiCBPTa8FgGqrjB1TicE5S9xnzKV+wVLyr9QsibLQ@mail.gmail.com>
Subject: Parsing dbus introspect
To: James Feist <james.feist@linux.intel.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With dbus-sensors, if I follow the Association property, i can find
the board that owns the sensor.  However, we have a use-case where we
want sensors to be able to have their own EntityId and EntityInstance
values configured via the json --

This lead to three situations:
1) sensor's board doesn't implement the Ipmi decoration
2) sensor's board implements the Ipmi decoration
3) sensor's board implements the Ipmi decoration, but the sensor has
override values in the sensor dbus object owned by EntityManager.

The way I see to do it is to introspect on the dbus path and service,
and then search the list of interfaces to find one that starts
"xyz.openbmc_project.Configuration" and then search that interface for
an "EntityId" and "EntityInstance" property, and if present, read
them.

So this leads me to this email:
1) Has anyone already got an XML parser they like and has used it in
this way?  Just to save me from figuring out the exact way to wire it
up.

busctl call xyz.openbmc_project.EntityManager
/xyz/openbmc_project/inventory/system/board/18_razorback_card/18_rzbk_temp
org.freedesktop.DBus.Introspectable Introspect

s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
Introspection 1.0//EN\"\n\"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<node>\n
<interface name=\"org.freedesktop.DBus.Peer\">\n  <method
name=\"Ping\"/>\n  <method name=\"GetMachineId\">\n   <arg type=\"s\"
name=\"machine_uuid\" direction=\"out\"/>\n  </method>\n
</interface>\n <interface
name=\"org.freedesktop.DBus.Introspectable\">\n  <method
name=\"Introspect\">\n   <arg name=\"data\" type=\"s\"
direction=\"out\"/>\n  </method>\n </interface>\n <interface
name=\"org.freedesktop.DBus.Properties\">\n  <method name=\"Get\">\n
<arg name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
name=\"value\" direction=\"out\" type=\"v\"/>\n  </method>\n  <method
name=\"GetAll\">\n   <arg name=\"interface\" direction=\"in\"
type=\"s\"/>\n   <arg name=\"properties\" direction=\"out\"
type=\"a{sv}\"/>\n  </method>\n  <method name=\"Set\">\n   <arg
name=\"interface\" direction=\"in\" type=\"s\"/>\n   <arg
name=\"property\" direction=\"in\" type=\"s\"/>\n   <arg
name=\"value\" direction=\"in\" type=\"v\"/>\n  </method>\n  <signal
name=\"PropertiesChanged\">\n   <arg type=\"s\" name=\"interface\"/>\n
  <arg type=\"a{sv}\" name=\"changed_properties\"/>\n   <arg
type=\"as\" name=\"invalidated_properties\"/>\n  </signal>\n
</interface>\n <interface
name=\"xyz.openbmc_project.Configuration.TMP421\">\n  <property
name=\"Address\" type=\"t\" access=\"read\">\n  </property>\n
<property name=\"Bus\" type=\"t\" access=\"read\">\n  </property>\n
<property name=\"Name\" type=\"s\" access=\"read\">\n  </property>\n
<property name=\"Type\" type=\"s\" access=\"read\">\n  </property>\n
</interface>\n</node>\n"

It's pretty easy -- it takes no parameters and returns a string that I
feed into an XML parser, and then walk the nodes --> but has anyone
already done this? Maybe I can use their code as a snippet or if it's
in a common OpenBMC library?

If nobody else has done this yet, I'll reply to this email with the
patch that does it :)  I'm definitely interested in suggestions on a
favored c++ XML parser.

Thanks
Patrick
