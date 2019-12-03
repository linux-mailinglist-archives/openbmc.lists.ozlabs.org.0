Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D7110FBE4
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 11:41:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rz6j3zmpzDqWd
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 21:41:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bGkfc3NT"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rz5g3G2WzDqTn
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 21:40:18 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id k196so2841899oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 02:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yj1K/0hr0Gy1unDPV4bJJbY9tQVVrs6tQHFQZCSA0Bw=;
 b=bGkfc3NTj+ENBqO2j+sZh28N0MTL7e2xxhE1OExdg8Kb9roUZRaJDRNnoTvJphcJMO
 TpWhUMm8t3b5aKjAJC7jYw/ghOoqN3n/5tGcsLmNAJztf6eZzO8QbKAvLV8EmPa2WOgX
 FXGd0lp1o2jBuGhkrcFNZyJFI54S2W32XSe7mHcWRYq5f+OpiIYASdBSQ80VIk8y5N2A
 d3Mz7CWOTjd+YpOoQ7/xypwkix5TQBmQ+M+9nnXfwMss9tHOERdFa/7AOKStqfW7etck
 pcTK2YT8fYYrt1fwSQZRN4ZEtNlriwbnZLhRZxXfINlulsb9ZyAH3xbv1fd0TG4l54Ov
 7mEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yj1K/0hr0Gy1unDPV4bJJbY9tQVVrs6tQHFQZCSA0Bw=;
 b=ZWLGNn9ULnCcBMeHdt67XzFBDgA8Y/bDh9XHVT/8e4RKUSWfo6r7UFymxFUR718yxI
 HEMthO3RS+AGH9EQeCbXYNsrLQHPdgoJUqKKdGWelWzUMDrCGjKd+bM69foRmTzBSjlE
 yOVIQOdZi7LWPfXVBwjM7g0dkXHjAgdyUm2LHAeZlRc2rZX9S9bvLs6Vut2MD9TWjqU0
 2Rek7EvwPIsgVnC6N+rvsXgDzEi0GMzFUCcq61nPc9MjweMhMKf1gk2P9wF9jLo8SQFV
 5SoGbQ44dN40uhP6XSXpSp/YnI7jqhm2ODsMnX8boO7E4NcRKITbme0tHL3fAjcy803B
 WflA==
X-Gm-Message-State: APjAAAVD+LP0YlnHtrETzvpd7qUxVFJ29xxIwXfDdSL6xI4S/SgNWgbi
 ljf7HB3UCUt1SJkcN2bpeIEB9ePWR1X7C0tnMTeHRIjg10k=
X-Google-Smtp-Source: APXvYqz60sA2NSKHXFYH5gFj1QsMrCViCJfRgSO4miHPCHVBjS49qsRQJXXJs8ItPm14j6qqo7ZS56LDzPqZYOo8LpM=
X-Received: by 2002:a05:6808:906:: with SMTP id
 w6mr2783048oih.122.1575369614289; 
 Tue, 03 Dec 2019 02:40:14 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 3 Dec 2019 16:09:03 +0530
Message-ID: <CAE33tLFdozJw-8aPv_GHpoUz+6E5xfVVx+Qk9_YTCbJ0e1J3sQ@mail.gmail.com>
Subject: Add sensors to S2600WF
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000003fee360598ca5252"
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

--0000000000003fee360598ca5252
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am using S2600WF configuration for BMC firmware.  We are having
temperature sensors and ADC voltage monitors connected on board. All sensor
readings are shown on hwmon sysfs interface.

But it is not coming when issuing IPMI commands.

$ ipmitool -I dbus sdr type temperature
$ ipmitool -I dbus sdr type voltage

Is there anything to be done to make sure sensor values are reported over
DBus.

Thanks in advance.

--0000000000003fee360598ca5252
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I am using S2600WF c=
onfiguration for BMC firmware.=C2=A0 We are having temperature sensors and =
ADC voltage monitors connected on board. All sensor readings are shown on h=
wmon sysfs interface.</div><div><br></div><div>But it is not coming when is=
suing IPMI commands.</div><div><br></div><div>$ ipmitool -I dbus sdr type t=
emperature</div><div>$ ipmitool -I dbus sdr type voltage</div><div><br></di=
v><div>Is there anything to be done to make sure <span class=3D"gmail-il">s=
ensor</span> values are reported over DBus.</div><div><br></div><div>Thanks=
 in advance.<br></div></div>

--0000000000003fee360598ca5252--
