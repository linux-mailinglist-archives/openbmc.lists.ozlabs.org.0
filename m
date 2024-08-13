Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07723950E31
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 22:57:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vb2qZNnU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk3bZ6yspz2yXs
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 06:56:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vb2qZNnU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=osk@google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk3b31SKMz2y8W
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 06:56:30 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2cf98ba0559so4058686a91.2
        for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723582585; x=1724187385; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yXWZ+/6sAqSYSH3wX0/6dVPpBmRzV++pr7wFVAcpdts=;
        b=Vb2qZNnUbBN/b+BvLiBxWCSSMZoVNS2evcq05DeH71LK4//7q4AW8qWNHovtGXG0Zg
         kmc/Ii0XOgz0kNMxrnbDAdZ525/3jKg2PsFz4xc3Gog0JCD7Gh58CMC5F0MMQGCK7aEJ
         +1UwAkcMHVx9Znst9WWvtAJjopDSKFhDy7rUo/pO6xMBGrCc7e2Qs2Fmr1mo9GLOu6X2
         MGqpJVEwsUgbDWiH8NytSG/JFSsJa6twCwhgJDOs+kZP5tx6ytRUq+XDAOVenlHwZ+rL
         dC4oGsQ1ltkKxybwjn9n0XVtB6b1u5QdONK0Av0HjX41kNMIf7a/UY7Iw2i619CvakVE
         0anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723582585; x=1724187385;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXWZ+/6sAqSYSH3wX0/6dVPpBmRzV++pr7wFVAcpdts=;
        b=DAaRiNB+EbSfubyTQ5xZZbbPgTuz4ShVwz05SWWKWlXZoZeARpM86EfQNUkuCieDv7
         9CoaLpL6a0PC94xCdFHkL1juf/AAfokOIhU4rNapM2Jmz//BV/99/7j2QlFmjW0giA5f
         +9rbPjjdqrWE05k5uDOhlC8kbuZD/Zal2y3dpny6D8bEnpP5rI3VhP6GzmShH5/VOxk/
         49CfmkYGHLWEKGtC/VGtCrkemYPp2Cy6ZOzdosrL3IFM+osk4Q6BheN3ESmsj58egwz5
         /EhqQM7hYHBuL49M3xPvjyPQ7w8iGoIeF6FIQsM5qtMdHXMZhsE17XtjGcNiNJJh2BTl
         Ihyw==
X-Gm-Message-State: AOJu0YwMFJeX5htYgkhF7kA0uCmK6bZ+KzPc+T/YUjLWazB/QSD0/biA
	S32daVv2xeXZgK+oQ7+EKr/pAX9yrw/9aY7iuCv4gJmLWztp6IuWC3aiKCLoJMQZARGW0ukkBXj
	gwQT5rwSjssk8Y5/jRUbKKmtD6VnC/zza+H5yRVkhWnY3eY2luAQOkoI=
X-Google-Smtp-Source: AGHT+IEg5j8BoIsxD7fswTV6OnCZ2x4uzWlXBZP+T2+vlnz0uJqWX8gn65fjhyEO6rTAUYRcxuB9mYA/l4CQlNIZ/Ic=
X-Received: by 2002:a17:90a:c702:b0:2c9:8a4b:b4d3 with SMTP id
 98e67ed59e1d1-2d3aab929ccmr712855a91.43.1723582584614; Tue, 13 Aug 2024
 13:56:24 -0700 (PDT)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Tue, 13 Aug 2024 16:56:08 -0400
Message-ID: <CABoTLcTjdrJ2mDFnAtTGA_SgFvYE5=1Dm5B9VcPKDtR8kUDhtQ@mail.gmail.com>
Subject: Reading SOL non-volatile bitrate broken for VUART
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jonathan.doman@intel.com
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

After syncing phosphor-host-ipmid to
a48bf7766f7e2f9cbe1c74f3ee681f7a2ea66969
(https://github.com/openbmc/phosphor-host-ipmid/commit/a48bf7766f7e2f9cbe1c74f3ee681f7a2ea66969)
I found that `ipmitool sol info 1` no longer works. I tracked it down
to obmc-consoler-server not exposing interface
xyz.openbmc_project.Console.UART for VUART type ports.

I believe obmc-consoler-server's behavior is correct, since there's no
baud rate for VUART ports to configure.

I worked around by having getSolConfParams return
`response(ccParamNotSupported)` rather than
`ipmi::responseUnspecifiedError()` in the case where
`ipmi::getDbusProperty` fails for the Baud property.

diff --git a/transporthandler.cpp b/transporthandler.cpp
index f89f8f3..a7b565a 100644
--- a/transporthandler.cpp
+++ b/transporthandler.cpp
@@ -1682,7 +1682,7 @@ RspType<message::Payload>
getSolConfParams(Context::ptr ctx,
                     "/xyz/openbmc_project/console/default",
                     "xyz.openbmc_project.Console.UART", "Baud", baudRate))
             {
-                return ipmi::responseUnspecifiedError();
+                return response(ccParamNotSupported);
             }
             switch (baudRate)
             {

With that change the behavior reverts to what it was prior to the commit.

Thoughts?

Thanks
Oskar.
