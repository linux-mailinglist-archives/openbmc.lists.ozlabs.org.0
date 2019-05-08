Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 222EC17437
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 10:49:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zVWg50JqzDqH6
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 18:49:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kh7Q74ub"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zVVr6jTwzDq9G
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 18:48:20 +1000 (AEST)
Received: by mail-it1-x12e.google.com with SMTP id l7so2738341ite.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahXTCIi8+NfuZHcVwYeizFw6ISdmfughyjSVCst0K/c=;
 b=Kh7Q74ubzKBBXdBkHe+A0iC5UW9ONdWNY/NSTz2xpbJGXs6/NKwNsawORGt/4lhitp
 eG7p6J+TyYsYw5BlsX6lPpG92hrY7uv1uzZtWIkv4RDf5n270heouOr4gBePFNBO6q1W
 jX3zhYOhSI8ybQ/QuPJHWT7lHY70CKgPEhtMFM5dcEUWSvzaVjfs6ZV17gIpycRSSZ02
 06SXu2Gfm8leW3nDsy8PbuUr5dtdSEcYvU35h3sXyjX1pfI3WBvD1NBZ/XAdJTjoBM+U
 s1XidcGRkgoc/cz3AMF1Rn73z7P5u79VkguyyAm8W7v9I4MTYrOoftzXHRMfbU/ZdjAo
 0Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahXTCIi8+NfuZHcVwYeizFw6ISdmfughyjSVCst0K/c=;
 b=R1ti7OPrM4kbWQSNGfwT23YWQHdrlfdhGyM/G3m3QLq2oXenqdiU0POPZgMoOduV2N
 MlFjKeDm+xyugkxY9hLS5Is59GlwvBlYlskqW9ao6HS9W9x10hCPb7VJ7RgxKu+k0L8W
 1TB1D3mbujvZj0FDlmrJPJgSixrT+IyiIeXBSomVtvfHUwWB4yE9AuXcj+FEoTJxVKSX
 ZceO1Xr9pP6c6HnjD98EMLIGXK9BDqwJFOrwlMGF6MM3q7n6z9IXbfrSUMy0pdEaRAbO
 gNqvTSprFwrrNoqBGuIjidhSaUFv6BNLN5cDqiaA61zhttZr09NhZVm/QkZPn6SBOW/g
 HkFQ==
X-Gm-Message-State: APjAAAXOcM80BYu2o0/l1UhWZb7Fvu+t42qunGwtFT0lGWb42CiEmJMo
 CgLtjOB5ie9MOpGE+JdC5xR1hGBfPNMT5TZ5XbxVQBbidCT1lQ==
X-Google-Smtp-Source: APXvYqx8NfwxjaWtclae0PYYl8OM9b5P4FT8EWsKex9LtZZOA0Nqza5pcWRBidg/4HgQyCLI488TiqTa0eNcRIelZJA=
X-Received: by 2002:a05:660c:148:: with SMTP id
 r8mr2740119itk.125.1557305297430; 
 Wed, 08 May 2019 01:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
 <CACPK8XcjuXuqejZ4oabLTE-Nv3+JXZ1Zn3qkeT3P1akpR9yFbA@mail.gmail.com>
In-Reply-To: <CACPK8XcjuXuqejZ4oabLTE-Nv3+JXZ1Zn3qkeT3P1akpR9yFbA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 8 May 2019 16:48:01 +0800
Message-ID: <CAARXrtk_AOkHQU09YO1rAzo7A4BbMw0gts+5r3jLK7upyJGXXw@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Joel Stanley <joel@jms.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> To clarify, this only affects the updating of the PNOR/BIOS, and not the BMC?

No, this affects BMC update as well.
With https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/21208,
the APIs in /org/openbmc/control/flash/bmc will be dropped.

BMC code update shall use the APIs in /xyz/openbmc_project/software instead.
