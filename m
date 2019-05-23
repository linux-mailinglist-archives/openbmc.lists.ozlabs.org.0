Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC4274AA
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 04:58:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458Z2F0V4czDqSF
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 12:58:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O/6/ubI6"; 
 dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458Z1h6DdVzDqPB
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 12:57:58 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id f204so4147644wme.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 19:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aoBqsI1xb3okbBdb8CEhaq+cXbG0iaLYO7zt4uHVcSY=;
 b=O/6/ubI6IQMJNiMJbAKIrkquHVfJRWJvK3agR/BEcGHXY564YDSFD4NUPO99HmMsF9
 2sXXUPjFGNRPnflShfL+s6SgQdR+8JBE88BEGIe8xfY0jMffjrwKyLs08IntEIujHa6a
 lAcBe5AOghWM7vfoqCSN0McfTjhHJkx/H7+fnP55VHswReeZgjTrSLhZHKqt0ZMQAmvB
 QeKtgQUZ55DLcBxKCTk3p4p11kR9MgHfgf+wI93UPmxIG/W+UDNNXp8ktrRLAH971LkC
 6G7/DNYmAqH5bThHeFpl/ARpcQ1w/FaqI9SbNNOYGJoowLePd5o4AAvDF1qPHEz9FW2v
 zHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aoBqsI1xb3okbBdb8CEhaq+cXbG0iaLYO7zt4uHVcSY=;
 b=KHfAK7h5J5vtnESFwSnP+7bnQsbBuOLQ5GbItY/ZqH53N/ZyjqDvnTMS3xE3NrvSyL
 vZ9/utEd6jl9rZaLKJP89HYfneCx0hYEn6gwiseE3SazFzaFZyoi3ZkeQxB3s7Yce8J0
 Vy7NP3ugz9Ofazwvy86bQqPNOb9jYjPeGOg03Js55RkAbcRzVJnO69Zgsce4Z01atcYU
 aRrvfkGmYqdvqQYvgxTAZaFJuNenxnV2OPOI3T1+6Cw6w6Nvfk5DnXu1Chnetn5xHHOf
 Flks9DNc+wwmCnhgOVTOLAhXWeEQ0xJs2HmcJs/oJ0vI3qktXWv5gzwW4JQYNbdVhoNF
 VPIQ==
X-Gm-Message-State: APjAAAU2kiq4xbZ3N7QsQVIhKMeh1LWm6CqhphZFPbYJnUF977yLE99J
 Y287ztr+pp1vCgwocFCfW7dmwGVD3Q5DLKX2vMQeOMhi+LQ=
X-Google-Smtp-Source: APXvYqzt8eHlzHPwhV2wgQEoyIt95PcJ2d4VvwEDdbxwARM0Hv4J3v5NzkR6wbKNmm1OB3G4RCDq1w4M9x1JLlVSsjg=
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr10193362wmd.110.1558580274369; 
 Wed, 22 May 2019 19:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
 <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
 <006052f8-dce3-d523-6d7e-8bb610648deb@intel.com>
 <CANT4NrKDC92KOmUcsdP6hWarJKuRP7VTZSwD-F32g+Loqe4VEA@mail.gmail.com>
 <865C376D1B77624AAA570EFEF73CE52F94537DF0@fmsmsx118.amr.corp.intel.com>
 <CAOUmYFTYtxQBJk7iRAVJ7YUgH2-z_t=i9R1opwifJ72M97XaFA@mail.gmail.com>
In-Reply-To: <CAOUmYFTYtxQBJk7iRAVJ7YUgH2-z_t=i9R1opwifJ72M97XaFA@mail.gmail.com>
From: Derick <derick.montague@gmail.com>
Date: Wed, 22 May 2019 21:57:42 -0500
Message-ID: <CAOUmYFQECLzVUhSV-dRdGQbwjysQDrbEfT+xn_n1BcWdAn6_qg@mail.gmail.com>
Subject: OpenBMC GUI Navigation Update
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We discussed an update to the primary navigation and are planning to
make that change with the release of 3 upcoming features, LDAP,
Certificate Upload and Generate Certificate. There is a review pending
for Certificate Upload and LDAP and Generate Certificate stories are
being worked on currently. Once these features are completed, we plan
to make the following changes:

Current Navigation Structure
- Users
  - Manage User Account

New Navigation Structure
- Access Control
  - Certificate Management
  - LDAP User Management
  - Local User Management
