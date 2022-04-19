Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C202E507B9E
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 23:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kjbqz5llxz3bXR
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 07:03:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bQfEmzkB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bQfEmzkB; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjbqX6Mycz2yXf
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 07:03:04 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id f22so4010755qtp.13
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2022 14:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=+7MvZvb/w6MxqWEJ9RGtSIVm8i6C7ZS0iRMRbI+V4VY=;
 b=bQfEmzkBeSy4GOc/83BMFwUyQZVo7lOGq3dcLbvjfaEpb0Ro429O2sVt5JWsZdPoQp
 XvAjNziI/vs/zr9CA9k3jHM0BJosBDqGOvTeKAqCAx3ow3RzSnrKlCXKjserC33jt2tw
 diFVS1jw0nLd21M3RCYbrKaJ3iRNBctqG3FdHfbjVqCeBkT1dY18J4E1yT+oToXYyIps
 C323UQIFAiZQIue8nu4m/Te7YBa933G+onGMPW1+OHnsfJjUUHK7CxP+JKboiFleXrQa
 tB2bcdaB4l2ooDdqClZQ0NYEU8HPZH+J4/0stcqBghRBX/3N0kp+J5fkVUVncONklrU4
 SoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=+7MvZvb/w6MxqWEJ9RGtSIVm8i6C7ZS0iRMRbI+V4VY=;
 b=XxRlQx5B3TMsX+mAi7kLWxyMpO2cU+CyJdMRHamDick9J5VpTn2crBrK7kMLh49DWL
 Buuw8gvrbl4n+8zlJFwElDmEPTbYjqW1GckBfMRHLEZclRu3EkK14BBD9zAPIqCzVUHd
 +otOXAVx27QTZPmplHKZDZc6WlZ4LQ3ecG/vpkIwEOt3sPJJxgXA/Sf/i1E4U5KvDKGb
 1/16kJXmGC4XFdGlT27ogB/ayKj2UuMKHqMXTP5gUI1KozH4DJdhoXxyvLE2pgEZoso4
 tD/p434JddO4p5l7qL+nGSW2YxugXK8aG2b/bEUQ3NZJPm4Tdq2wyJI1kn7itPNM1tFx
 Tlfg==
X-Gm-Message-State: AOAM531UE9Qz5KgSwfuIddFcO5ZwM0Ra9ym7O4bI3NRPYVuCE57bcHRS
 w2jP5rJgk1YveuNwA8fbaKdKbUN36E63DQ==
X-Google-Smtp-Source: ABdhPJx7TDhz0/9rJXJiY9RyIHLTv3DdWNgqnXV/KHpJblTiGcrI4eZgP+XcKpYFOoE4nHumqt6CjQ==
X-Received: by 2002:ac8:58cc:0:b0:2f3:3700:36d0 with SMTP id
 u12-20020ac858cc000000b002f3370036d0mr3305070qta.687.1650402179989; 
 Tue, 19 Apr 2022 14:02:59 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:55c0:3bd0:850e:e3dc:3458:c00b])
 by smtp.gmail.com with ESMTPSA id
 x24-20020ae9f818000000b0069eadcdc218sm478217qkh.135.2022.04.19.14.02.59
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Apr 2022 14:02:59 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: preventing chassis power-on until bmc Ready
Message-Id: <FE2B7C36-070C-4DCF-84C0-FB3A53EC0837@gmail.com>
Date: Tue, 19 Apr 2022 17:02:58 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Greetings,

We at IBM have been finding cases where we wrote our services in a way =
that they
assume the BMC has reached "Ready" state prior to a chassis power on and =
host
firmware boot being allowed to start. For example, to power on the =
chassis, you
need to have collected all of the vpd associated with the VRM's and =
power
supplies. This vpd collection occurs on the way to BMC Ready, and =
services
in the power on target assume it's all been collected. We have other =
scenarios
like this and we're wondering if we continue to whack-a-mole by fixing
these individually with explicit service dependencies or do something a =
bit
more global to ensure our systems aren't allowed to power on until the =
BMC
has reached the "Ready" state. This state ensures all inventory and =
other
system data has been collected and created on d-bus.

The BMC reaches the "Ready" state once all services within the =
multi-user.target
have successfully started running.

I know in the past I've heard of servers that allow both the BMC and =
Host
to boot in parallel (which sounds awesome) but we're not there yet. I'm
contemplating an optional package in phosphor-state-manager that could =
be
installed and put in the obmc-chassis-poweron@.target and prevent
any other services running until the BMC reached Ready.

The obmc-chassis-poweron@.target does have a "After=3Dmulti-user.target" =
within
it but that doesn't control the services within the poweron target. It =
just
ensures systemd will not consider the obmc-chassis-poweron@.target =
complete
until multi-user.target has completed.

Anyone else have a similar issue and/or thoughts on this problem?

Thanks,
Andrew=
