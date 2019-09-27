Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CAC0C54
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 22:01:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g2jk3x5tzDqP0
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 06:01:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BT35ljS8"; 
 dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g2hv6FPZzDqPF
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 06:00:30 +1000 (AEST)
Received: by mail-vs1-xe32.google.com with SMTP id d3so2714101vsr.1
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=og67Aedwss4wzf3jlueAaoVsVid68cIDIxg0JjReGMI=;
 b=BT35ljS8CwNPrTGJ4HyMWrt4a0gtKKOjhmWrtGZUsVd3o874N/IDSWVpJsgT7Xo6Si
 L/jmkiF+6Mp7JoCyYSWF11mgvxVlZMApCJklOyP7tW9GPUkO4avchCGBDiO7fCNFBJjH
 9MYAvxthpNpBUmWCbDqLdtKjgI5ngR9vPiGYnnRHNE1mU1zF0Z+X5oDHH37yNuRXpHdD
 ByCaAJDBET2vqwPwI+ODlW/0yhKNydBLYc7TTYCIktMFhqPyWAIM5tjgdhs1aS/Fubj5
 1JtnwDnQx0Uo2wMDbTiHxHrZ+Pc17a0ttBlX3dqIsoq0oLC4w9JJWWrGUehyBJlhJ3TI
 BMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=og67Aedwss4wzf3jlueAaoVsVid68cIDIxg0JjReGMI=;
 b=A9iuotwUGetSkDSgd3xBLufabNMyL0Sdw2cYR/YQYr0/bb8kZQCoD7sAqdpZ9LGLjr
 GkAvvAztl3yu4U8tLEZy83/10acW7Kcx6lX6X8bbBhCPfzL5E/9pIEYPGcd7svzYJiwV
 r6sIe2hlOqsxDw3s4JPEY2B0hvy9LjIZEe5JeUEWiKTaa4lQFXyHvELE2OE7mAMgsBXe
 7wGq8+T+KCl7MD4MtQUk/vU1HlpXfCryXb1Rctwhx7qxn8gBvDgkMx2g1nF9JHEAZL2C
 BJFRKT7b2RLiiRzbipkEQJuVmXdxPxGN4L/+WtUBIZNyHX9Kzu6TxG+fpUT/sfcdY1eM
 0Htg==
X-Gm-Message-State: APjAAAX58e79pwivX17yHXuK9js642yWMa7YrJXYDbAhPjtSs1Szot6W
 8yLmthtNnfEKB+KQSnauSbLovxahX29EmVYEy1btu2Canu/gMw==
X-Google-Smtp-Source: APXvYqwkmW6UkBY7yY4YtJUYaW5IdK0vMGNNzuojGpbl3aSs8OhJLixAszJqKul9qkFG0wEXXn4affPmo+2zuCrVsfQ=
X-Received: by 2002:a05:6102:4a:: with SMTP id
 k10mr3620721vsp.73.1569614425494; 
 Fri, 27 Sep 2019 13:00:25 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Fri, 27 Sep 2019 12:59:49 -0700
Message-ID: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
Subject: Redfish Aggregator
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000044944405938e5618"
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

--00000000000044944405938e5618
Content-Type: text/plain; charset="UTF-8"

Has anyone looked at the Redfish Aggregator proposal that was voted on in
DMTF recently?
We have a need for this functionality. Would anyone else find it useful?
Would anyone be interested in collaborating?

----------
Nancy

--00000000000044944405938e5618
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Has anyone looked at the Redfish Aggregator proposal that =
was voted on in DMTF recently?<div>We have a need for this functionality. W=
ould anyone else find it useful? Would anyone be interested in collaboratin=
g? </div><div><br></div><div><div><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature">----------<br>Nancy</div></div></=
div></div></div>

--00000000000044944405938e5618--
