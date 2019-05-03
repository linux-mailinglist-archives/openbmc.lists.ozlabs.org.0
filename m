Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C30132A1
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 18:58:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wdcw6jwDzDqcR
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 02:58:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lxqdbNcB"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wdby1XxXzDqXV
 for <openbmc@lists.ozlabs.org>; Sat,  4 May 2019 02:57:47 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id b3so3179545pfd.1
 for <openbmc@lists.ozlabs.org>; Fri, 03 May 2019 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rvgWyUrB/EHOHweuyr8QmIgqAJJS/QiQOBHUguxX+wo=;
 b=lxqdbNcB/Z4oivSmDfNcNwKR3CHCpoN/iFb0THJ9hN5KQerJpyIYi+yISNk6zkmaXS
 qkLJ3yNdwymiAzmtvmuPEUmbYjZhf/oO0b4rGzSep+b170CylIf6X0KnwsYkPi4g9gPx
 wNLoJJKl8BUg5YA9QS00yVca7yVDCLCsZrosCX+drQIQjLk2h9lmc58QFJyO3dywAX5w
 9e/eg2TZXgrQnNdsjRzXa2uE6PGd6cgkm9ZmzC1YTMpzAXJJwaN1CZm2EqM9lXJFswIY
 ZPz4YCmNROk0SQpQ0bUzLgfThweOHbCXtuucQfiomuWBA0k5Vec2o16ADJf6gcNyPREZ
 m4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rvgWyUrB/EHOHweuyr8QmIgqAJJS/QiQOBHUguxX+wo=;
 b=g3sfhct1jjjIuCXqUDw5tcit+da1MiZjsHYhJPvemjBYIKGo1smVinPnC+aer+QoN8
 5sAQDr0schf2/NLJjA2qb9P0pkjg7sCkuH2ZvD+CYuECjwcJBTJrqTOBFt1vhUCjOoWu
 C78fxN347PBkpRql3Gvz+gD5uTSZgwc+f5tFT66Mp7mMYv3gd82p0t6KFxft2qXBOIns
 zCGfdL1cblLODmgtrk4yVaYs09+BWyqPIoRnGnXr9tlCcweqttTmJUrJLe+Oo3HJajuV
 9d0C3+ADQ2fqEZ9JQ7p0AjLDQmftDicRE/lSdIlKZDIU+o3a4zfg29LK2K5yiZRlIsjF
 xz5A==
X-Gm-Message-State: APjAAAWvT6zza3RSiY7688rH6k4u9oo2hgP8wYix8PJqqQN4vziYVmyR
 rmlHBchyBhklA34vwhI6L8W3rDcNpN34SMHBFAcwVs9QUkg=
X-Google-Smtp-Source: APXvYqxEsT6iUjEwfge3IgkyIZZaVQgMSoPsvHBwllzc1FINgSyvQ9pQ/G33zsSy4AHDKWvt4TfZMu4FH78WOvgpnZQ=
X-Received: by 2002:a63:5c24:: with SMTP id q36mr11714901pgb.314.1556902663529; 
 Fri, 03 May 2019 09:57:43 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 3 May 2019 09:57:32 -0700
Message-ID: <CAO=notyajN+Sft6MNBku81Kiovagfo7B_Pzm4bqf1NsLtAOX7A@mail.gmail.com>
Subject: pci util cpp library
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

Does anyone have a favorite CPP library for talking to PCI?  I don't
think parsing lspci output is as clean.

Patrick
