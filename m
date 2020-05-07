Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BC1C80AC
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 05:54:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HfjC6scCzDqx4
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 13:54:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C4a0sTjF; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HfhY1K2nzDqvN
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 13:53:47 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id t3so3407063otp.3
 for <openbmc@lists.ozlabs.org>; Wed, 06 May 2020 20:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jcrT8AybKQ1dkgUjM2ZYOp9x2fYuia3JnXOLiOdKznA=;
 b=C4a0sTjFQTQfXkPhHze1MC+uDE5kS/ihFkHNaZDmuhyH/RkrNGzrevETurMq95jxNM
 CuwrTwn7eWKLYoBujWQnEKl3LyHMF6UjtxfE0BrQnZXVwNUnUXSoJ3UKAjKvE2Zq9pUe
 qnN60Ql+DyZcgUV7RN3k0Drs1cgk6feydMVOZOiikw3IgQY0KEFmEgPs+mjsgTTe3pqT
 FIKf5+Kg6ai8fTAERhzZor/n/J0EsQBWNb97eWA/tm1n/+ZVwPqafA0JXfIWluCtpuPo
 vDRTu6hF/ftr/TqfIxF+/0toNdiI8lF7hKiov0qgpZzxcMyBqVvixLl7hoavdETGdpBa
 cmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jcrT8AybKQ1dkgUjM2ZYOp9x2fYuia3JnXOLiOdKznA=;
 b=LrDg2K2FjYn8RupbYVc5YdPlcDg1hWFhMEwLxdeQuRO55nijLd/zXsBUui1hDasB4u
 rs3N0BG6b3in/FLoyxytgi0yoHOsGWS7mpaME8zHHIFpRjpEPlLxyqsaahaKaI26QZor
 eQynX6FCP+ZEUktPBwv4jhd0hrcHuiI8smJhSFbJOsYNuY1oN6XmU5inEq2Cpslk9XXk
 MXF+Gy5EBd53KGTTF6Qcu2oZeHt+g2zwCKK4liGJ1P32u+s5Moy660C6ImI8khzSzRIe
 DY8JkyWvBHxRDxwfGJfHZOejM1n6AEAwdNH9rV9Nbj9bAou0cB9+akKzuR2Jwg36UWc2
 cuTw==
X-Gm-Message-State: AGi0PuYdc56dI36zsEw2FxcvD1elpAQTlmzkxPJPAwTB0nlzgTDl7yTj
 AjUDCKIdbaRdXI5KslzRal2f2EHLDsk=
X-Google-Smtp-Source: APiQypIRlO44/DQNAOgctIhbPnyQI7Lcykpcz180cW3UezxpBeJRaaQ5IaQ+pfMjN5LjE5OBxq5u/A==
X-Received: by 2002:a05:6830:155a:: with SMTP id
 l26mr8695074otp.246.1588823625113; 
 Wed, 06 May 2020 20:53:45 -0700 (PDT)
Received: from ?IPv6:2600:1700:19e0:3310:9ed:7687:7c6b:8b4d?
 ([2600:1700:19e0:3310:9ed:7687:7c6b:8b4d])
 by smtp.gmail.com with ESMTPSA id u197sm1091506oie.7.2020.05.06.20.53.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 May 2020 20:53:44 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Add new repos to CI
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <7302f733-8a0a-46ba-efe6-cfadb1ea1a22@linux.intel.com>
Date: Wed, 6 May 2020 22:53:43 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C60F371A-D791-41E9-9874-F538557ED1CA@gmail.com>
References: <7302f733-8a0a-46ba-efe6-cfadb1ea1a22@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 6, 2020, at 4:28 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
> Hi Andrew,
>=20
> I recently had a couple new repos added and would like to have them =
included in CI.  What's the right way to add them?
>=20
> openbmc/libpeci
> openbmc/host-error-monitor

Added them into CI and triggered what I saw in gerrit

Andrew

>=20
> Thanks!
> -Jason

