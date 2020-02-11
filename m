Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6B1593F1
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 16:52:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48H6jk0T2czDqNC
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 02:52:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bc3jvEoq; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48H6hJ0qqRzDqML
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 02:51:25 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id l9so13204259oii.5
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 07:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=7d1OqnX4JggizBTXQhgkSyCQs57kNRAlRh3libDjz3o=;
 b=bc3jvEoqYMBekBvNsDWjvDIjVuStlhWMAai4PlWwY+jx6zAxD44uhZG8F1RPo1+Rmz
 4KhzcoFtkQtSi9x0STAGbIw72kuO9QL4VQBTva0IEiFvWMUjSIn4UHcWrZiCeXd95fIv
 VpPdQC83yHI657icM1L1Ke7V3wBoFDaCF92Avi0hF9U2iUcoIbAToR4yO2m0Zwuuv8p7
 fq4DQ8Dx3KzMRSRAvfHMS9w3aOSUABJO6+NhpSP7/nVfAsonjvymsHgvZovk34kOl/E/
 QDm5PuF8lk/AZnWR8EWUELpfCI2zluggTAMeFj99XDz2oV3T7eLFLbO9U2Vc6dits6Mp
 DE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=7d1OqnX4JggizBTXQhgkSyCQs57kNRAlRh3libDjz3o=;
 b=jp7JgoT3bFHJsX69qm4TbnA4HpoQDf1FvGLHZJOKrAKPoE9jkIOCI8Hbvc4gg3Rjaa
 hjgYI+erJPxGVlwgp/qxo7rZcefcBqTGrOLi6do1gWWID4j5RcIxG+IbrbzYWHnmNeXd
 Z9+cT0jPmIW6i0SuLp00K6qliaJWTb5vluBrDVbddeKZnBuQome9eL0hIEggyTWtN7V6
 DTi25b8B9sP0ZayjQ6+AuBHBT9BSqJzRjYicvKx9FntxjcokzN4ldHnACminwnZv3ffZ
 kBs6warvEgEIT0ICjyWQH1yMSd91eZWGz4c0z0KcdHqxzj4WGA2RkA1udQ1E4bFotP3w
 61Ng==
X-Gm-Message-State: APjAAAX5WHy7AX3sMZjwN8yaeMtIKQDdj8JPikLshmhl7keeol/2vIYP
 TEzZMhEpyDuEqXuEEIaMNA2vEfxN2kY=
X-Google-Smtp-Source: APXvYqxubiWl416fUYBEOeytKpOPFUHbCWk1wIyJc9PeE3ccsMIFelFxOezdmLkWQ/xIjJWQPtSt5g==
X-Received: by 2002:a05:6808:9b4:: with SMTP id
 e20mr3130050oig.37.1581436282261; 
 Tue, 11 Feb 2020 07:51:22 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:658c:8d2c:93d:7e19])
 by smtp.gmail.com with ESMTPSA id i13sm1196481oik.7.2020.02.11.07.51.21
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 07:51:21 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Enabling OpenBMC Debug
Message-Id: <776B4FA1-4427-4FC1-802A-BC4192CA3D2E@gmail.com>
Date: Tue, 11 Feb 2020 09:51:21 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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

I find myself running a lot of different commands to enable a variety of
debug data on OpenBMC when debugging different issues (usually BIOS
communication issues). I also end up giving these commands to a lot of =
people
when recreating issues for me. Stuff like this:

# enable debug logs in journal
sed -i 's/info/debug/' =
/lib/systemd/journald.conf.d/journald-maxlevel-policy.conf
systemctl restart systemd-journald.service

# Enable BIOS communication service debug
sed -i 's/mboxd/mboxd -vv/' /lib/systemd/system/mboxd.service
sed -i 's/btbridged/btbridged --vv/' =
/lib/systemd/system/org.openbmc.HostIpmi.service
sed -i 's/ipmid/ipmid -d 0xff/'  =
/lib/systemd/system/phosphor-ipmi-host.service
sed -i 's/0/1/' /etc/default/pldmd
systemctl daemon-reload
systemctl restart mboxd.service
systemctl restart org.openbmc.HostIpmi.service
systemctl restart phosphor-ipmi-host.service
systemctl restart pldmd.service

I was contemplating wrapping the above stuff in a obmcutil command so =
instead
of telling people to do all of the above (and dealing with situations =
when
those commands change), I could say something like run "obmcutil =
debugon".

Any thoughts out there? Would finer granularity of the debug be useful?
Are there other forms of debug people would like enabled?

Andrew=
