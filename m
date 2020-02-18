Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E98162A5C
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 17:25:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MR6V1W3CzDqc7
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 03:25:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k8AaY7tc; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MR5g4BZZzDqWT
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 03:24:54 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id z193so22964388iof.1
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=c0KvJe/pbJowtPFHENRRWyMk5LRMHOq7v+RXjUB845k=;
 b=k8AaY7tc2fd+YYWhKT7seOq6kxVFYe45OgFvUJJ89bsDPJzruZcVvWdpQJqCBXAoPE
 VU0OzI8A8BI7JcPmPgQaOw2+P4BWzUzju4QVSq7n0MfRTWN1BHHrPpAuEAxLRiN+9Y0A
 +qi6VAUhK7/UuiCsklbBSyPJNN7H70Hc+znssXuirwuKVzIDcSrNk349NRWcIaxzPe4T
 k3dCbWBZMtgPk82FPdm8XvwtmuxdpkqUvY6fmfGoG3/KnAXN82vrLTQhYCiHDswkz6DO
 0paB80e3mdl82ucoKWWra3NFP76TZJvPww4kTRi0HfzoS7qGdPP+XiuCVfSXnuEfL9wT
 NOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=c0KvJe/pbJowtPFHENRRWyMk5LRMHOq7v+RXjUB845k=;
 b=iTZ99BwFJN7W4BrSmd5SShzx2xEa/ilHGnayorDAeTaKIe0tjyh+w8uZdK/URcdXKc
 ADrqhivwI7N/gn6pnC3OOLGB5RedKdkzbMfhBGZCXebiQh/TdGXLQBltwmLbGMk1jaI7
 zdVQEPUpolUh+oJCrGN/QZxZIJ2QwbGyD9sm+mbnMdEwjkaZ31Tt8B5cW16KDWqU1uCh
 Yiv3OxEd6liNUEOrpMYl1pQqJrq+d2NTIwEmD6lohAtzWB/9a2ZDTV1JQPRJBh3Yvu8N
 CCFPVHGeJWJ8H0/lRVUY2c57HYutP65jIgvZsMI9pkST56oPGKh9yFvCiLUKsooqMMEP
 Ex4w==
X-Gm-Message-State: APjAAAXae0vVwbS+RI8cNeWn7Tbf52h4KkBExB9Vp57qEL0ebKV/nwaU
 blzlthgc8HcBovq/doXxPLmpZG5cMMI=
X-Google-Smtp-Source: APXvYqzndNFrI2xMVS1DrAmDlm7ILXAkRfa+skoK0BzXuty38OocUZ1srjYU7nlLJGB+WhiK6mdJHA==
X-Received: by 2002:a6b:3742:: with SMTP id e63mr16175612ioa.303.1582043091359; 
 Tue, 18 Feb 2020 08:24:51 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id w16sm1447969ilq.5.2020.02.18.08.24.50
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Feb 2020 08:24:50 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: termination on hardware errors
Message-Id: <6FBB6835-036E-4495-B28B-44D1210294DD@gmail.com>
Date: Tue, 18 Feb 2020 10:24:49 -0600
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

We have a requirement from our manufacturing team that they be able to =
configure
the BMC to fail the boot of a system if any error log is generated that =
calls
out a piece of hardware. The idea being that if the firmware finds any =
issue
with the hardware, manufacturing wants the system to halt and provide a =
clear
indication of what that failure is so they can fix it prior to shipping =
the
system.

High level this will probably be a phosphor-settings field that =
phosphor-logging
code would query when it gets an error log that has a inventory path in =
it.
I'd like an external state to indicate when this event occurs. Maybe a =
new
BMC state like Quiesce? (Quiesce is used by host when it is in fail =
state
and has an easy mapping to the corresponding Redfish Quiesce)

This is just a feeler email to see if anyone else has an interest in =
this type
of function or if they have other ideas on how to fulfill this =
requirement.

Andrew=
