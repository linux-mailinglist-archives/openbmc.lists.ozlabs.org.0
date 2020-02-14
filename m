Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E215DA53
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 16:08:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jxbc38dgzDqRX
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 02:08:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q/meYC80; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JxZw0cZbzDqZP
 for <openbmc@lists.ozlabs.org>; Sat, 15 Feb 2020 02:08:07 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id q84so9688677oic.4
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 07:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=9QQZvDLQz2IFScaUQfyuWHgx+Dw7q0ynuWIbnwzXlXE=;
 b=Q/meYC80dq/qz8LKMASgykzkkJTHieetR2Meg5c65Ia9F7BfHPv7tQeD+Vqab3k/dx
 nuGOGawQCWQRLXenz1jEtYWe7tcfqbCYswlXKap2sZ+MARjN77ZSU4kRVzj/NWQgNuJN
 +R21Oj6OrMfYYJw/cwRC1gIr5D6Yr9UyiBz45UNRDAA6ozlF2ZZZuqFEokqJkKzW+sZg
 SEjtJPWzoONEf6k5YNgF0DUoIXnqMsJOn3fwy6xqjKmxmmxePcLsMH1r0RtRUi4t8Rgg
 rbn98Ff/azfGgwYv1JxPyMbqeCSJ4hsErggwo4xoVK8YA/vz5XrLG+58/CKdVkjnXV+1
 Kq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=9QQZvDLQz2IFScaUQfyuWHgx+Dw7q0ynuWIbnwzXlXE=;
 b=Y0uktMgr3eOE5sZjpHtbggOavqnlBr+TyRpQ0I3Pern6B1LJ8iE3I/3xfw+ToXr5J+
 1HpIxrjIVvBfzo17a+yu9Xmw2dg5Fft4vMFhPW/Xg/Vj/RZ1vIBfe0ua0W9dSIXHfcfu
 nRRRDL331XtJBji2MZU2JxR5IuM9KkBAcuLpdiUDong6uvve1DS+Ly/KQW9qzUNnZ9MI
 XbqKOPYusfJLkQNe6kRd/N4i7uBQv8CJGu1owkcA6PL6eJBc4/PcZjjrwPL+zRoJP1qM
 Rovuzs05M/0AwrlgDhSrmt64SnTnK5bl9OXXt12u+aGUpUBNl+Fnv6HiV3rRPqt//ko8
 glcQ==
X-Gm-Message-State: APjAAAXzA73N7DZYS6xrDJjXGW48SxZjjTn1TZDzpoXod9OXF7yztnda
 7i2V8xSoXPVAVG6jDSJ3OeCFudVU+Jc=
X-Google-Smtp-Source: APXvYqyYCsjNdhrSxOnJeNQpGPy4QmXNvb1O7p5da25YoAHIONdoz6WkIULWdb0NdC1x3zFkEKNhBA==
X-Received: by 2002:aca:5a04:: with SMTP id o4mr2151652oib.71.1581692883796;
 Fri, 14 Feb 2020 07:08:03 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:44e0:fe24:6c83:10eb])
 by smtp.gmail.com with ESMTPSA id t22sm2228080otq.18.2020.02.14.07.08.03
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2020 07:08:03 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: IPMI_CHASSIS_PWR_DOWNs multiple uses
Message-Id: <A8318787-86B4-487D-9A7D-4220F3725114@gmail.com>
Date: Fri, 14 Feb 2020 09:08:02 -0600
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

We've been working on standardizing our Redfish -> IPMI -> OpenBMC State
Management mappings[1].

One issue I'm running into is the dual use of the IPMI_CHASSIS_PWR_DOWN =
chassis
control command[2]. This command in its standard use case, is used to =
indicate
the chassis power should be removed from the system (non-graceful power =
down).
The issue I've been hitting is that it is also used by the BIOS firmware =
to
indicate once it has completed it's shutdown. For example in the IPMI =
Soft Off
chassis command path, the IPMI Chassis Power Down command is sent once =
the
BIOS has completed its shutdown.

The problem with this is that there are use cases for shutting down the =
host
but also keeping the chassis power on. For example a GracefulRestart is =
a
graceful shutdown of the BIOS and then a reboot of the system without =
removing
chassis power.

Is this dual use of IPMI_CHASSIS_PWR_DOWN something specific to our =
systems?
Is there a solution to this that doesn't involve special code on the BMC =
side
that tracks the current BMC state request and does some special handling
of the IPMI_CHASSIS_PWR_DOWN?

Thanks,
Andrew

[1]: =
https://github.com/openbmc/docs/blob/master/designs/state-management-and-e=
xternal-interfaces.md=20
[2]: =
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/29051/1=
/chassishandler.cpp#1093=
