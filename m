Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B4F16AD5A
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 18:28:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R8Cv0cPXzDqVk
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 04:28:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KmIfBb4C; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R8C31J42zDqTk
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 04:27:24 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id h9so9397467otj.11
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 09:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=nXZFa7LDtVrQNsl6a+y6z+5q2e5NoAfgGIM9QrsVmHI=;
 b=KmIfBb4CNmQyvhO48PANlbUJnMxIdIWcnbBEWjpd8LMD+qzZnrQi2Sz35K4GLW94D/
 WcA7M+ISn+6lLjgUftpGK6oKHWkUlS5ZLviEFwIveI8iTjOMccyRfAzZbEiZ3C+wftrR
 AifwJ9jIxLzqr1ICSHbdKNpOfT6HoU45Bu+RS8eQSxjWbp/0aT29Fdkjpb78sDKzm2tL
 MtDU3c+11ylRxU8WXK4Q7+4si30+ViwxlCHE2ANVJzCu8OqnzH7vTUN/XJbzHvtABl6a
 RqJlsYswBQjy4HiwSVC3YchJSoZYxfiHjswa+Ds7PeRIDWw9sNilv8nmZVcEaBDvAzzi
 wtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=nXZFa7LDtVrQNsl6a+y6z+5q2e5NoAfgGIM9QrsVmHI=;
 b=eX5PvU33EwU5Ksk7Sh3j51oJIdB5DnDr8Pamdns5i7XTVuFdtFJFZ2JrazYi07pS0j
 UZ/XYls+KAr6L9lfeP6ryP1DVN14hUi0UKn+W60IREpfKmK3ADxoCyHbigzxm3BncGHH
 GYk5ayXTSZ+DG5IPQ5KP9U3L62llULwSF2vxLTL2lkKnG1lK9nuel169uEE/INTP25zL
 OCNKnRctbD25cxmDy4H9E2qFNk3jF51SX4bH/qk0Y4X0GJ28THfzNZtbIJytWHqTN6rv
 QYBwVu0nnllKXqDxLAZOhVXnLc0EVpD++AubeWbmzvNEOf0oIIptyCRlpgd93uFUOv9H
 S1tw==
X-Gm-Message-State: APjAAAUxSyAVMxe9N9i9+h8nkBfUDWf1RSdc7Fx92UbWZKhqVSf5wgr8
 Us3m7QSwDkZsw9pJkudTR/8AYJqX1MI=
X-Google-Smtp-Source: APXvYqxmOz72yEgG4VZl5J9QwbWtZb7oa/45liaodDCGSqFl55AWBlachgA38mu4OYpCmQdP2HRQuQ==
X-Received: by 2002:a05:6830:1d91:: with SMTP id
 y17mr39210382oti.276.1582565239850; 
 Mon, 24 Feb 2020 09:27:19 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id g25sm4631029otr.8.2020.02.24.09.27.18
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 09:27:18 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: System Firmware states on D-Bus
Message-Id: <9CA8B63A-991B-49C2-A8D1-83D1CCB6C46A@gmail.com>
Date: Mon, 24 Feb 2020 11:27:18 -0600
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

I sent an email[1] out a while ago about mapping Redfish Host states to
PLDM Boot values.

Now that we have that design moving, the next question is whether we =
want
to try and map these to our current IPMI-based state sensors[2]
(OperatingSystemState and BootProgress)? These are currently displayed =
when
a user does a "obmcutil state" and I see a few other repositories =
reference
them for boot status. The openbmc-test suite also uses them fairly =
extensively
to verify different boot tests.

If we want to maintain backwards compatibility then we should map the =
new PLDM
based boot progress to these two. Mapping them does not seem too =
difficult.
I could have phosphor-host-state-manager (which hosts these D-Bus =
properties)
listen for changes to the PLDM property and update the two properties
appropriately. This assumes a system where the system firmware is only
IPMI or PLDM (not both) since they would not play all that well =
together.

=46rom a Redfish API perspective, it will just directly look at the PLDM
property.

Thoughts?

[1]: =
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020417.html
[2]: =
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/State/Boot/Progress.interface.yaml
     =
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/State/OperatingSystem/Status.interface.yaml=
