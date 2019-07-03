Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1792C5DCBF
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 05:06:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dmGp4Z11zDqRd
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 13:06:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kRekJvs+"; 
 dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dmDJ1kZ6zDqRh
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 13:04:31 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id cl9so365731plb.10
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 20:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pS2aPbwJDfIqVhbNAls3ejvbZREXsMdQugQ6emDRw2w=;
 b=kRekJvs+4FlqYwjZbilRxNm8zs/7KiVtDyzKC/EjpZtJwtn95OJsFzxgNCfeVDKwCK
 LkWweL5qpIPkO9AQIWhOxbD1CtoJcqD+gH+rQY7KGvwpFocLmKwgzjxN0Icpn7tsSytX
 ZfDdczRoy36W+4O8RWIqL7dHtgO2VONUbeU8UUBBcj2VNICQ+65zDrdnzmnEs34iZax2
 j+YNNqhfBp9+TkGE1MJ9VQymMtchLxk/iamnnLAeoqNFkYrUVKZRFM9Sik+CsP0DF7E5
 aw++gDMYGOcq+rp5m2pAuD/jKiM3S5xZ5bfBFNhsj4whL5tTd5pw96MFe0gdznjWsSmH
 vWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pS2aPbwJDfIqVhbNAls3ejvbZREXsMdQugQ6emDRw2w=;
 b=TMHwzZbiNYVAvlnGkv0kJe018+KsQvR/C/Fr9sMrKNo2VtyzWb7fvBAItRZxA3iHzp
 oogFAM4LDeRNb0vdPM8+khO26PHfj7znB7mrEHDeph7bCfM4/duLJRN5XWPG80sCXUwy
 56q1R4y3IHjG1h+UvM3RaR/dAGwNJHYeiHOpYxa5Xc+uWocAQVaCsAWAw+HV0YaV08ZO
 y6LLhDxyUIR/4ILnPLzN24VVL24OSsFLE48v1/ThlhpvN9vG4/4K+M4fAAnfb/hNLnI/
 loRxdeMZX3qAqzqwPW0F8Yx9xBClmOOppqwITny+IGhMU+L3znoZKdZJqctqjqKUt5Lx
 +2jw==
X-Gm-Message-State: APjAAAXiR7n2jdQvweSABPYRitrwgsJp5q+GKgtCrnPKzheJPz4DJS+7
 Hmaf6DZnrUvAe4Z6ZdEVd5ujLM+YBBqtnFxeEJACDw==
X-Google-Smtp-Source: APXvYqxNEQ5M5PG535k9NkXaQ9vBYMK8YEV/1HEaKeAMLgcBz7kjrXUOxdGqMdLm2ibaikm5V/qymRJWnKviefHUafo=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr30547659pls.179.1562123067833; 
 Tue, 02 Jul 2019 20:04:27 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 2 Jul 2019 20:04:16 -0700
Message-ID: <CAO=notzxbMtyjvW5Efo-Pp3c1-hZz93aFwPvQiumsp_fj2nuzw@mail.gmail.com>
Subject: Future features of phosphor-ipmi-flash
To: Adriana Kobylak <anoo@us.ibm.com>
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

Uploading the BIOs via phosphor-ipmi-flash is available for review,
but it's not tied into another daemon.  One must provide a
verification service, and an update service.

I'd like to provide the option to leverage phosphor-bmc-code-mgmt.  It
looks like in this codebase there is a notion of a signed image, but
the signature is attached.  It also looks like, there's some version
information that's meant to parsable and involved.  I haven't had a
chance to play with it.

With phosphor-ipmi-flash the hash file portion is optional.  Because
phosphor-ipmi-flash doesn't define anything beyond the sequence of
calls, one could use burn_my_bmc and send the hash down separately and
then the verification target could trigger something that concatenates
and triggers the bmc code mgmt signature check.

It should be somewhat straightforward to tie the two codebases
together (as an optional usage).

If someone has experience with programming against
phosphor-bmc-code-mgmt and wants to help with this or at least point
me at what I need to know, I'd be more than happy.

From reading the docs with the dbus interface definitions, I think I
have the general idea -- drop the file into the place it expects the
file (a configuration option) and then call the dbus methods.

Patrick
