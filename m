Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2748742C44
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 18:29:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PC4b2mDKzDqmY
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 02:29:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1zxdS5R"; 
 dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PC3Q6mCjzDr1C
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 02:28:18 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id g7so8947639oia.8
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=09sFl0GbUH9KjiUm1ZQZCPPnh0nA0Ac33jli7HacvWw=;
 b=Q1zxdS5Ruvg8Kswe45QH47PdJsnckDky5trWRODavBBGf1Kqe+T29bANNGSdCB2Gsi
 yYGzsAiLcywMwRwBbLWqbEZicLwlGR6/wpx45ZdhryRbYGq4u1fevxN09g2S+wkmAy3N
 qWu1SpseEoDogvfv83baNfkslZh7oFEWDoFPVKvmog+EmOC4UVbGCsaIOtXpvHrV6Ixb
 2ZpEjdaf8KaTaIt4EXW/IF11n+kJfhKChmS78X4f30HRjVPEINTKMQHrO5FyzkYCdEKn
 abxm4jn9bybbJQRqAzt7Z+mPFA5V9ppHRFS4XyEimA7hA7LlzhRm/SUIoAbY9bSagWtU
 FC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=09sFl0GbUH9KjiUm1ZQZCPPnh0nA0Ac33jli7HacvWw=;
 b=cfF2OCCka0Fd9YpxQFDh0Y8aHUDRvsbNWd7wmuvT1dZeitgqa/EPyUbntfdVwlwDH7
 PvZU7bHPI01lqKIsLx6D+kBpSJ+BQW/ujNXCUk2rCWQF4zGvS9uhrD5y1FGn6neh2Lrs
 nuUBqMwryHRqqE81RCs3prHmyGOczO09IJ0eaNoZ+P8xbIebxtprc7uFl/nqryGxN1kH
 qDWb9wa3qQcS7FDAXS2oHcbadIWyAlrR6/3uIASWLmURYfia4s9XnHK7AuPTOkhvk3WN
 NrFG0ou/lVzJHV5gES5OwyO8WjdhI1nOJXtZIyUUafjt2XOocSDHVjGmSBM3WpnAYDLu
 6w2w==
X-Gm-Message-State: APjAAAWcUjV6a5WUSXCgtQPmr7zdIvR0SufR8XhF0gCtq14/oquDs2A/
 WjV4askIV2D6fVFFIj+cOtQsqu1Dg88hMDK7cXJ2Ug6o2mE=
X-Google-Smtp-Source: APXvYqzp8v98ZcxF+Gn8+bD9kqGZsazNMhIl75Yxd7pVBxKqPYLAWnPouqmBG6MIt5y6T2v67hm09ZviDQi/U22mC+c=
X-Received: by 2002:aca:30cc:: with SMTP id w195mr57940oiw.42.1560356893815;
 Wed, 12 Jun 2019 09:28:13 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 12 Jun 2019 11:27:58 -0500
Message-ID: <CALLMt=pM8dUmCOmW7aFfpZFS4BbsgZ4+Q=A8f+1ouY9kovBaKQ@mail.gmail.com>
Subject: June 12th OpenBMC Infrastructure Workgroup Cancelled
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Nothing on the queue to discuss. Feel free to add a topic if you have
one for next time.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
