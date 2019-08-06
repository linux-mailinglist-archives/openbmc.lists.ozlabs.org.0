Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD3828B4
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 02:32:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462bFB5cK4zDqYh
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 10:32:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BMSn7q+t"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462bDg1j8szDqWL
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 10:32:01 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id 19so40475819pfa.4
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 17:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=v9zF4NY4Vgs97wtWzsw7fCCyx025T9gcwOMM4BJM70o=;
 b=BMSn7q+t9YVABeT1c68qiw7k2ZjL7fmGQw8CdaLlFwnST2Q0P5ZCgyv+l8dFyW26NR
 DZBx6oruZk1C8KKN1xNFvUPBXzQou4FnxNWi53jQg+Hqx8NfAEhlEhhUnHRvNmZjbg+Z
 tOLrds0d4+R7P4XJ+ujgOH79wXglGHZIDks1+yJCGXqevOJyB6euaa5zJIGEMZWq9raI
 YYVsXXSN9w+DSilAMW8DRKmdXIRcgjCUUh93/JurT6KZrPsBgfWRlFj1HLe16B/HA6RI
 5rX6Ed1RBdrms7U0S03tbTjWkOvE0mhuWDKqTuT6uSUfn61kyruc57QV1yvqSnjK+Ri3
 8RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=v9zF4NY4Vgs97wtWzsw7fCCyx025T9gcwOMM4BJM70o=;
 b=jv+TWzqKsQx7ptqLuHZlzXAKJLQkw0NN31UoD3hWW8C0sv5zDmm/dq43uizXkeC1zn
 fxmoMsPuk3jVGfV0aflfuGJ5/mWlPhQY2BBItCcnXFtK4R6+8Q2Kx3lhZA8LuKSnOYk4
 uie4F52RnOD3i2CsL8Etl+aub3bacba0Nu5JbXqBfpPVTAD5zgGeCnqjtVi4MyP7gl6S
 aekRiHQ0aLkonXkdIOSYJLg9KAKbNKoFq6OYwsjk9f5THxlOL76uJ+gnnHQV7UmbsSEa
 EpZiTI8RIwGnya/5OGyBxfIW+KJRvNAv2l5GP5f2EKXlhoAn32YD1Nf6Iuco+2d4/dlD
 lHNQ==
X-Gm-Message-State: APjAAAXwRl26wtErScADcGQCOlGs6BR8Kgj+qpE8C7u2QubCq/ncV30c
 vZfrIBtg2hU5JN0EyXyZ8g7gxHyoIR/iNu8zz7Cuhw==
X-Google-Smtp-Source: APXvYqwc4XBBgAEg+RczMCDd8Eap64BLNMjdhpHfyXvxMF1OmBJ3r1DImcXRYcFNLZc28khG8uODQMnR0to1gtJcD7s=
X-Received: by 2002:a63:2784:: with SMTP id n126mr507741pgn.92.1565051517278; 
 Mon, 05 Aug 2019 17:31:57 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Aug 2019 17:31:45 -0700
Message-ID: <CAO=notzvf3R-fQVEqOjV=W0_P27FgmV4zCWbpkSV3pw0-h9=Kw@mail.gmail.com>
Subject: Supporting eeproms from device-tree in FruDevice
To: James Feist <james.feist@linux.intel.com>
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

I'm nearly done adapting FruDevice to handle FRUs that have drivers
ready, and raw i2c FRUs.  Before I push the code for review, I wanted
to get early feedback on the design change.  I wanted to keep it small
and surgical.

Basically, for each bus, before it scans for FRUs raw, it searches for
eeprom files for that bus.  And validates, and adds those devices.
Those addresses go into a skip list, and another list (used elsewhere
for writes).  The normal get frus code is then run but it'll skip the
addresses already handled.  Elsewhere, the code that handles writes to
the FRUs will check to see if the bus/address is in the list of
"driver handled" ones, and if so it'll call to write via the eeprom
file instead of the raw i2c commands.

Basically, the new code wouldn't interfere with normal operations, but
just extend it to leverage a driver when it's available.

Patrick
