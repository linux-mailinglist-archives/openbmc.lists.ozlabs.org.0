Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED9A70B63
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 21:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMh9K2fYlz3c5W
	for <lists+openbmc@lfdr.de>; Wed, 26 Mar 2025 07:19:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742933986;
	cv=none; b=GjQ01/GsUg29ILOCj6x00ipa/Jml4XkEHen6vSJ8WboFgsKWhMpu+obVeie6UdkSfNmW2irmVy3tMuiubF+vHUzVWjMEhitphMNffha2cwS5hrqQyBMqn7U87tRW664XmfgLvs3kkJtcdPki25fdLw1by2m8ahzfRiKbY0ZDQtAHwvMrygQ9Owj2KrxqOwBZQoCzDAeULVu4PtzeYnYnL9O9jWIilxeYvexxpx4ucewxwedHacnBMXPFc5Cesx2jiFxxC0tkJMR2BV/QYObAG7h+Lvj46wV79mFprI51ytYf/i5KIK4LzH74oOyIAdO+H4aq+/vK6+RlZPwyBssF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742933986; c=relaxed/relaxed;
	bh=uMzgo3AwuYWcqUfCxBSFSRm8SbtpumDKmfH7GTJMrsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FR1mamHB1UXjW6TD1YtL6z1Xh8wQEGZ8e2BxWZKrcN2B546Bfu9nY8fJYGB/LI4u/zPUGss5yqLdeeanMN24cuAqmOXJ1gnXhNE45yV3RPMUIzBWr0RgVNQkGtbaDPBrtvEf0O/dYowlRMvBKBDtMWs7BvvvzZ7+3+dx2I3V6lffLf6uLvcCkqEeXhU+a+KZe6ppRhNLpfdehOQhRQcW9uffVlWx3T384eOOkSWq1uuTlnn725jU4dOPJcdX+FgPsnXUBNVWInt55uDXgflxgdn8/rbqzJkpn2tB4Au8SgMzQwN154BhdZPG5WIQRasCt26uh8zs5Y8eMlUCkNhaLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SN9N/RGb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SN9N/RGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMh9B5Z2Rz2yk3
	for <openbmc@lists.ozlabs.org>; Wed, 26 Mar 2025 07:19:42 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bf1d48843so56508691fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742933977; x=1743538777; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uMzgo3AwuYWcqUfCxBSFSRm8SbtpumDKmfH7GTJMrsc=;
        b=SN9N/RGbg1YFMvUsjNhRd0eBppech2ajDOS5sMSDTLQ+SmlFNvQVnQm0AtpomtoX/u
         71wei5YAkcR04pLuFeaxgM04PXEEXMwkRN9O/nJXP3w2laejs+UCn9LNsD3mMHC/+qzK
         yfaLZbnVpelJbXBO1y8oJZFoFDzayI4b6K4Qdw7AKgFvqT4Fy6lL141RjbIwik7mmxiq
         05zb6k0Se+x2gmJrlVRuEPLWeZgDW6gl6aB19fvLG6WQIOPGT8js01I2a7px+6OsCgm2
         E14hRQjKO91eHlXFKN6nqyORKMOzjq3yuD5hcWXvK5wHMRCLl7wFJQB2oIPk0icwLBjW
         gwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742933977; x=1743538777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMzgo3AwuYWcqUfCxBSFSRm8SbtpumDKmfH7GTJMrsc=;
        b=ISVbW8TwRX6MT6Ten0IIApXx6DIoki8MtzDZJWIJv+/HD/q7uWyvojz/fMzDvUWXeb
         irfW3HBr0tU4PXFXmF+kMwrP4R4XohnfcD9HOEqPR2wwPRSWMkplc2lIx2JvGpMIEgcG
         LmfOLEHaXSi95VqLFLrWI+WoM7QltCAEYKSTZwVfb1QYl5AqOVmGuWNMW5+4fuGjrYP6
         GeH3chypZ5v+KIP5xLckQN1zRV7fVXxligJhrBh9WoUbWwtEyI7pW5GZVax8CDEUqrrd
         PnY7IwAzihJvP2RxmRFtC7QyR/iVNsxXIfgrkA0vtjxhT2BSHRAM2x0OPgnbDCSjN4Jq
         7D8g==
X-Gm-Message-State: AOJu0Yyqv8AKkkU7NSei4ABkHv940irkOjysmg/sNOeKwrgpH94uR47K
	ZWJCbwHgbl/mrvNFPPNnYKKzJVlmtAy3/t6VupQ6Bm8y7LV/F1vr
X-Gm-Gg: ASbGnct5B4nmSYkSlkUGpd+hkV+MRrK++AhD8rl5Jb0+ZExbSL4X3ki1RgXtEArRAxk
	Svdr/8CvJG4gFyl54687P5g9VXDPyiiWP8qDAaJ0XcthBgeQCcEPmz9PEs3f9yF8pNpegujeGzd
	9fSWdons7qjJI4aDjpI5b5lxqW9vRcNiPUTW9ilU2ItS4gQVT+opjLKS4195Nt7gXDRgvzlNZS1
	C3i247kDY79RXty/u0OT4jQcJ/PMu4601E/1zeXxv9CmOE/ZrB4/Ax64VHR/hBU8CreHF0AH/2l
	BY6qSU6aRmjynPKjMbhz5kSzJEglNE9hY0fXseqjLSkezFt3pqC13tpssQ8=
X-Google-Smtp-Source: AGHT+IEFoUM54uoRvF1WenSKgCuGPIQDMD0QXb4kl2Bgs7ct1VfSdKCzjNB6ALPV9tqQie5lrRiI1Q==
X-Received: by 2002:a2e:95ca:0:b0:30c:1d:b147 with SMTP id 38308e7fff4ca-30d7e22a5b7mr56992151fa.19.1742933976585;
        Tue, 25 Mar 2025 13:19:36 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d91106esm18999871fa.99.2025.03.25.13.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 13:19:36 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 52PKJW6E014666;
	Tue, 25 Mar 2025 23:19:33 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 52PKJVqV014665;
	Tue, 25 Mar 2025 23:19:31 +0300
Date: Tue, 25 Mar 2025 23:19:31 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Settings backup and restore tool prototype using Ansible -- RFC
 on a published project
Message-ID: <Z+MP02Uckh6jt/3O@home.paul.comp>
References: <Z9ftA+zMr2ljEbZg@home.paul.comp>
 <F4A34EF4-9572-4863-97BB-8ACA4B7FF1A5@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F4A34EF4-9572-4863-97BB-8ACA4B7FF1A5@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Adriana,

On Tue, Mar 25, 2025 at 02:31:33PM -0500, Adriana Kobylak wrote:
> Some previous discussion on Backup and Restore for
> reference: [1]https://lore.kernel.org/all/YiEbhAQEdJzf706i@heinlein/T/#m50f639da25e073f973e18b5728c15cc1bf61d168
> In summary, the DMTF is open to having a schema proposal submitted, they're just
> looking for someone from the OpenBMC community to help drive it.

That's interesting, thank you. Guess I have seen it before but since
the link to the issue was (and still is) 404 it wasn't that
informative.

What do you think about my approach though? I would think it can work
right away with many different existing Redfish backends
implementations without going through standartisation process and
covers a wide range of actual usecases. In my first mail I outlined
the core ideas which are trivially expandable to proper user stories
if needed, so it's not just a "feature" but one can clearly describe
why, who, when and where could be using that "what".

Do you have other related and relevant usecases in mind that can not
be nicely covered by that prototype I've shown?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
