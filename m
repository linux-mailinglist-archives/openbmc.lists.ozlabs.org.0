Return-Path: <openbmc+bounces-334-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 348DEB028EC
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 04:09:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfBmx4z4bz3bsT;
	Sat, 12 Jul 2025 12:07:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752160860;
	cv=none; b=lAFXpDWiIAi2EvcrSKCn5f9ZWht5Iq4A5l+3sUqRZB5NPAxQeySetbRnaT8ZIIQcaj8/wuT5Icr741AQ7pQa5XHKPwsKCMPkCOq7hAf3Mvz/eu9sOP7YEqRW52wEF56f4J9Qc4C+a9A8AzwkOyePWgclL9Tv+PeBUDI57Hnwe0D5j1l/wzmFn2DZR10SACcxtZMQnItkEHUYbq6i0jv9AuN/KIAyCozgBbt6VLN5FhU74iJLZ8x+aTWNDzwE8RhWkY+CV7do42QAWznERnATtnYFtVdT5iOiguBqSTBFamfMjHD36Zef4fEnZV//PpDcl6O8e0qqxNLS3LKP62Aesg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752160860; c=relaxed/relaxed;
	bh=Ds7++Ij2+1V4ib5aZvqnghth0svM2cKB0bqVi1/rlYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=W50Yw9aey2cIjfgu6MsddjrPqSxVh6PL0IyZzReKj+wZDULFpenXWToQgR8k6RoPZk7C1kchqnjSsJSXMkG5eNrmdC3F0F7s9m9ckAw7xEYFcc5XNHG7WCxgqkbz3gSAJdfQnDuEC5rx2ch7/RB21QoUIUYtFfvr728lgrGi9xawAEfdvIHEvaehQVIW1O+4+Yci3pRJ0OwEKagKhPxVFwAcRSkqaqFpgDB+l1yc0qB/D+/0qvgjSdLJemc0itV4j6CJegT0pXsn+BOJgMjEegUQ8VKrXmFw0KmWeSF+OCqchFt5om+cLolbt0U+evqgUy3zKNXrq8YTURFDc4QtrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWTlYsg+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQyUrXSn; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWTlYsg+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQyUrXSn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdJT65wwWz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 11 Jul 2025 01:20:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ds7++Ij2+1V4ib5aZvqnghth0svM2cKB0bqVi1/rlYY=;
	b=hWTlYsg+VjlBwm4Piq8aboa7mfWKw/VxLab0EuP5uV0cMC6osf6K02BadEa2ygEUc4bSRp
	GONcdopOEiYnyUjCOl8Gt0m/XS+ernC+pqU3ML+hsYcogSTd8E9HQ1KXXAeC8CjZ3uK6ss
	Ch8yy7UlCBCmI0r1cumTiIcLHnzv8NU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ds7++Ij2+1V4ib5aZvqnghth0svM2cKB0bqVi1/rlYY=;
	b=WQyUrXSnG3OSyZ/N8h6G9rY8T+aORV7qo8AB2UEAh0m+pcFGGogrZhp0O6is3+w8mUsRkK
	zdLptw23Iuy9tqiayZ5DJZlJdS3apZ0Fr36CW/xKty52lVvXAWziHP7Bj1SUZ+VAmSuPHj
	lFQoxZEm/PMS+VYAfwrOrdCE9CulnXo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-F_0AfkWHNpWIgzOX9EmVrg-1; Thu, 10 Jul 2025 11:20:51 -0400
X-MC-Unique: F_0AfkWHNpWIgzOX9EmVrg-1
X-Mimecast-MFC-AGG-ID: F_0AfkWHNpWIgzOX9EmVrg_1752160851
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a587a96f0aso32190911cf.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Jul 2025 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160851; x=1752765651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ds7++Ij2+1V4ib5aZvqnghth0svM2cKB0bqVi1/rlYY=;
        b=Q1TjwhW6eGwGPjdbKmtCn7ohmPu2VyoiIoWrC0NiaSua48gmEdk6tsw7P+90p12Rrp
         cYiVTZHuVsWQ/JnbMEPlcXDhqDtnixoNQFY5txPMuHN1PerVDJYptdZGsElxixapvTqS
         ZXHOhycQ0JyenZl1XzsgicowC57Cv4ol0hC+9ZW6hS2rehG3dG72Jkttmo5Iw+DIMGk9
         HRg35vKtLSxOY2xaAzpaalOKX7OVhsiDxq58e0Sqeg3U8o//CgCdrtMvAfPUpCeAcOZq
         D/2T0ykKFrWR1zCwvg1ahmzd/NQEueHHx0zo1I8OR20Y1TP8L247ojSqxdEQpyysssdu
         o07A==
X-Forwarded-Encrypted: i=1; AJvYcCVBm5CzN1aOCbfsetcxASyhQk4OmqNyWRCt6Q1mhEoPobX5hov8oQysLK6Ot62dHdCoyD7QfVqm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxVi0atsGXUeSLDft7WGTG6rzY/9HI30nlTktE+SjTkhHyekUP
	f/ck+Zs6cf8bJ8cdvuB5VRBl/rSfAXa/IlowOzQ7ZELy4ry8xySyxl9XJzAPNesDvh9qfQ0JMom
	ldSiW/LBlKj52lExPLVBQng/4zjRVPNE4XfmnTrJtRg0Bq+zKu1gy0YRTe0Yi
X-Gm-Gg: ASbGncvHhTBe/E2ln2E1worBYvkpuUW+PtWUA1Tiv8KK4vXFntTlLQjkx4sQe6X8LkC
	EVmKICk0v8WQG7jIXolWZJ0cUiIdO95ze0Vu9sjXCEitY/VW5ZoTDSyooBOSvSmNTAX/uXenQMJ
	2LkGASRjGWqmh6niw7jg+EPhVlGxRAs3NP/0V4RuX9+K7kfaHXPimINXXhvUR8D2fRsWSRDgF+w
	EYyBGNvunE/MEF1H9upMPL95+AdsQ3xIctiEidIB4UHbqwUHazMwc4wXu7xjY/5d9jlrewxp+mA
	h9MyWQt8kX3lYW3B9Q7aiUqtx8q/SEtV+H1fbKU8ty4neYTk7pzidHOVxskP
X-Received: by 2002:a05:622a:1144:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a9ec75e251mr55310061cf.20.1752160850871;
        Thu, 10 Jul 2025 08:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEToM0xvOjTAuNFn12a/+Huuy1Y8IvYOkC01RE80GL773b7iqyZVQh3usJvnkGTDa9plKREUA==
X-Received: by 2002:a05:622a:1144:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a9ec75e251mr55309261cf.20.1752160850187;
        Thu, 10 Jul 2025 08:20:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/15] rtc: convert from clk round_rate() to
 determine_rate() and fix a few bugs
Date: Thu, 10 Jul 2025 11:20:20 -0400
Message-Id: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADTab2gC/x3MwQpAQBCA4VfRnE3NEuJV5LDtDiZamkVK3t3m+
 B3+/4HIKhyhyx5QviTKFhJMnoGbbZgYxSdDQUVFjSHUw6FbF9TtDB7VHoyG2pLq2htbOUjhrjz
 K/U/74X0/Vlb142QAAAA=
X-Change-ID: 20250710-rtc-clk-round-rate-1093066d1a5c
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=6092;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9M3wopRrGysSMIdgOwMKcjjazdX85vpeXMPuYsQrbNY=;
 b=AA9zUj0gJWaQ5insN3QRj2sCaM8YtZtb1pwCdKfcn8t61rNC+0mFATNTarVGL7O+fipo2Lz7w
 iG1H+HResmQB2HXjyK41d1ZGP7JTaY4eabya5WkXNS64i/eBlg0iQAu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BQ8-IMKyn5XNo6o_kSYg3d4KEH7nGmf8yVSS1K6-bus_1752160851
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the rtc subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

I also noticed that in some of the drivers that if round_rate() is
called with a requested rate higher than the highest supported rate,
then the clock is disabled. According to the clk API, round_rate()
should instead return the highest supported rate. This series also
updates the functions to return the maximum supported rate.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (15):
      rtc: ds1307: fix incorrect maximum clock rate handling
      rtc: hym8563: fix incorrect maximum clock rate handling
      rtc: nct3018y: fix incorrect maximum clock rate handling
      rtc: pcf85063: fix incorrect maximum clock rate handling
      rtc: pcf8563: fix incorrect maximum clock rate handling
      rtc: rv3028: fix incorrect maximum clock rate handling
      rtc: ds1307: convert from round_rate() to determine_rate()
      rtc: hym8563: convert from round_rate() to determine_rate()
      rtc: m41t80: convert from round_rate() to determine_rate()
      rtc: max31335: convert from round_rate() to determine_rate()
      rtc: nct3018y: convert from round_rate() to determine_rate()
      rtc: pcf85063: convert from round_rate() to determine_rate()
      rtc: pcf8563: convert from round_rate() to determine_rate()
      rtc: rv3028: convert from round_rate() to determine_rate()
      rtc: rv3032: convert from round_rate() to determine_rate()

 drivers/rtc/rtc-ds1307.c   | 15 ++++++++++-----
 drivers/rtc/rtc-hym8563.c  | 15 ++++++++++-----
 drivers/rtc/rtc-m41t80.c   | 21 +++++++++++----------
 drivers/rtc/rtc-max31335.c | 12 +++++++-----
 drivers/rtc/rtc-nct3018y.c | 15 ++++++++++-----
 drivers/rtc/rtc-pcf85063.c | 15 ++++++++++-----
 drivers/rtc/rtc-pcf8563.c  | 15 ++++++++++-----
 drivers/rtc/rtc-rv3028.c   | 15 ++++++++++-----
 drivers/rtc/rtc-rv3032.c   | 21 +++++++++++++--------
 9 files changed, 91 insertions(+), 53 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-rtc-clk-round-rate-1093066d1a5c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


