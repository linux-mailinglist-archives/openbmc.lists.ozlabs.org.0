Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696647E5F4
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 16:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKZKl0Dxjz2yxx
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 02:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IJfhAVDx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IJfhAVDx; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKZKG625Sz2xrq
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 02:45:36 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id u22so9706788lju.7
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=rTBorjSeKAE5EZQJ79qgCrR03O+Gde3YGABcxw7Airc=;
 b=IJfhAVDxqFQJK+hjSIWT/nMUaYpGvFAcHFlINyRLVmxt1IUxrT1CcsZkjlOe0xaK8Q
 0iRQmXmt4s/FIwbi1L0Fad0Lh1kjnUQfzTCyxe8HSTIT/zyqJ3Pi/rKXUQBrxOArpwZ+
 hd2OrH9MtByfNQOXsABNvoQg4NWLwBPtdf1De5y2MmIpmiAKd/63I7OaPQrH2y+nyM18
 x0bmvixyw17jVsjVybi4vLAEA3vlrhIoWetE0JQoqiN87VJfHwmEuwgOA1DHUV59IVM8
 abUgPmGjOPyyp+u2Gmc9IiXj2syPWyh87ZfDc8NoWph0c2kMn1nEhxzDIcL3fK6yT56p
 ZGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=rTBorjSeKAE5EZQJ79qgCrR03O+Gde3YGABcxw7Airc=;
 b=MuAKsmNcqkim/yyzgZsYtKoATc6uvwv5Z1woFUItVBDKXKuAt2mOeXx+/8c1zxHxIL
 NTKhf+0Iwid9Lr3q6PhNE8q0gB3uKZTb782bbbFXjnQ/G7l1ubF3MJPcEPoj3E73bBSa
 PpaTPrg4GEAUIebX9ca3XrK8Vqm6J3kfKOhMQ1Zktd+W63cSMfF4B7zg46SxIh04njhh
 IoXnRag+0dOIRdWRXFk5mVX9IDqU6shV8rlHVd44Bdek+H263wV1sZbcMAzdpOP57NxB
 3kw4uDMrOhUBOMegW2rWoGV16PmxkXhoB5Hdumfny2Q4TSaveNJOP2RLjNhCih65ufCe
 LYrQ==
X-Gm-Message-State: AOAM531AfEXw+6FVm6QBo6BDHktDaGvreI3kvdvPBJGR5sLIMQan7W+o
 kwXn6T9Z6FnfNLCawYasbSs2Sh6bweA=
X-Google-Smtp-Source: ABdhPJyI3UveFd3WlArB6SvW6UZtXvyqal4WuhrjeWRG9Gzjq0N94jBc/vThh5mPdFAXab73Pu8PzQ==
X-Received: by 2002:a2e:8502:: with SMTP id j2mr2037989lji.191.1640274331513; 
 Thu, 23 Dec 2021 07:45:31 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id y4sm473417lfg.118.2021.12.23.07.45.30
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 07:45:30 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 1BNFjRmD002181
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 18:45:28 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 1BNFjRSk002180
 for openbmc@lists.ozlabs.org; Thu, 23 Dec 2021 18:45:27 +0300
Date: Thu, 23 Dec 2021 18:45:26 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: sdbusplus reading InterfacesAdded issue: not all variants are
 created equal
Message-ID: <YcSZlt4HPeBO3sL3@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

While digging into current state of SNMP notifications (traps) support
in OpenBMC I found some code I have no idea how to properly improve.

phosphor-dbus-monitor has a handler that's meant to be called whenever
a new log entry is created by monitoring InterfacesAdded signals on
D-Bus logger paths. The processing is at

https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/snmp_trap.cpp#L28

It seems OK until you look into PathInterfacesAdded definition which
includes a hard-coded std::variant<>:
https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/data_types.hpp#L66

This already raises suspicions and rightfully so: the interface we're
specifically interested in, xyz.openbmc_project.Logging.Entry,
includes AdditionalData property which should be of type
std::vector<std::string> , but that's not in the list of the allowed
hardcoded variants.

If I'm trying to use the std::variant<> type suitable for
Logging.Entry then msg.read() fails with InvalidEnum error, probably
trying to parse data about other interfaces, and this is a bad idea
anyway.

So what is the correct method of using statically-typed sdbusplus APIs
to parse such a "dynamic" reply?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
