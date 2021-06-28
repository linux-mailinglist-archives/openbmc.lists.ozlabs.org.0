Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B513B5B85
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 11:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD2hk3zFvz30Hh
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 19:42:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=eKrzh3Lz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=eKrzh3Lz; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD2hQ51PZz30B2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 19:42:28 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 v5-20020a0568301bc5b029045c06b14f83so18105319ota.13
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=09Ybf+zNUEIiJjwDqTv9wiEwvK3qLEbSiHl8kpoaKgs=;
 b=eKrzh3Lz1bwUmkZ9nyRWy5+NSsn3mk8FlwmUgikAnvjwgocOS8BBhzO11z42GpBzbz
 priO0BJZQA2OLHxIYrdvaYh22v7qBDITHgO+CVFBS8LCBdez9zkA70PXAKxQmaR5xzLI
 h1jfOiZpbnbIV/1B6pD8yqM75dqXBLV+5IJ3709hxCXbCmgJntcdXlmz5nbZ/sBXCpWD
 Ki2LYXqNjgOowDivOZXCsM0ddMLjpv5fE1ZJO/09z75vHpjCioff1Vn2uB29Hjq/CKCR
 D68JW7oyS75QyX3f8okHQEFi2tyyATUSQBktozoUsKETdU3dwebrRhy0PBi8SB/MIRef
 qxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=09Ybf+zNUEIiJjwDqTv9wiEwvK3qLEbSiHl8kpoaKgs=;
 b=sbVIYJ/l/GiZy0u2iHB2CcqkTmoU60BLrz4SWmQD78sXx9VrgNaCdErZeWHVWEDIvL
 TpLq58PXNsrcPQzMOsa6X4pbSKAH47Zqy/wBtFj7KzzL8t4pndL3CyV0ACnBUAA/sPJ0
 m8qv5uJ5dueOBTseZz4TxxJetZw735Eq2eT7mkw2cexf1tTyLSZxnllGilC2lq/vHscQ
 ATC7jy7tshKoIq0qHnmTdXerDfhHuTN0tsA67j9NMcfIjU/6UyL/HH69R9wibQCY1tno
 /dv6kLyUSQkmnqiwPdKvvqOlZtG2H4GLzvg3yvwzAYYoIIOsxluF2/dglVg5ChXXo8aE
 fydg==
X-Gm-Message-State: AOAM530+bQuxUcQyKoazNHf9qqgdnneYxw863b6F2HAl2+zBEDSjH7sE
 FXrCZToVS+tqgtZSRtO+fh2MJKpcPRSoKPSKIQh/3dnMcEJDKS/E
X-Google-Smtp-Source: ABdhPJw14zBEK8T467lDARH1hqg+dyL4d4IEPImtP5T9nfcKMwuS2cYBto+iz5fK96g6r5flnWvekssYWuo++Pj9LJQ=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr20233786otj.226.1624873344880; 
 Mon, 28 Jun 2021 02:42:24 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 28 Jun 2021 17:42:14 +0800
Message-ID: <CAGm54UHdTyPh0hGiatA44whg2PdRzJFg0gBnVHA4moYRr=aT=g@mail.gmail.com>
Subject: ipmi sel log revisited
To: openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to describe the current status and issues related ipmi
sel log in OpenBMC, and propose a possible solution.

# Background
There are two backends of the ipmi sel log:
* The logging entry on DBus
* The ipmi_sel log stored in "/var/log/ipmi_sel"

The configuration option `SEL_LOGGER_SEND_TO_LOGGING_SERVICE` in
phosphor-sel-logger is used to control which way to use.

## The logging entry on DBus
The logging entries on DBus in /xyz/openbmc_project/logging/entry/
will be parsed and converted to IPMI sel logs.
This includes two types of logs:
* The logging entries with a CALLOUT path in the associations.
* The logging entries with SEL metadata[1] in the "AdditionalData".
For the both logging entries, the ipmid will parse the entry and
convert it to a SEL entry.

## The ipmi_sel log stored in "/var/log/ipmi_sel"
The log is sent to the journal log with specific MESSAGE_ID and properties.
rsyslog filters such logs and save the "/var/log/ipmi_sel" [2]

## Comparison
Both methods have pros and cons:

| Method        | Pros                              | Cons
                 |
| ------        | ----                              | ----
                 |
| Logging entry | Use DBus data model               | Complicate and
slow to parse      |
|               | Support both ipmi sel and redfish |
                 |
|               |                                   |
                 |
| ipmi_sel      | Easy and quick to parse           | Data is
separated from DBus       |
|               |                                   | ipmi sel and
redfish is separated |

# The proposed solution
The openbmc usually uses the DBus as the data model and all the
services consume data from DBus, and the upstream phosphor-host-ipmid
already supports the logging entries, the proposal is to re-use the
logging entry on DBus as the data source, and improve the cons: to
make it faster to parse in ipmid.

The idea is:
1. On BMC startup, let ipmid parse all the logging entries in the
background and generate the SEL entries in RAM;
2. Use a match to get a callback on logging entries' add/delete
events, and update the SEL entries in RAM when a logging entry is
added or deleted;
3. Use the SEL entries in RAM directly when `ipmi sel list|elist` is called.

This way improves `ipmitool sel list` speed and possibly resolve the
issue of the current logging entry model.

Comments are welcome.

[1]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Logging/SEL.metadata.yaml
[2]: https://github.com/openbmc/openbmc/blob/master/meta-intel-openbmc/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf

-- 
BRs,
Lei YU
