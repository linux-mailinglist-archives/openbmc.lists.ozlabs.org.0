Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8B4A7EA1
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 05:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq5BM6qFWz3cDy
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:23:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NjBRJIHn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NjBRJIHn; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq5B12fXPz3bVd
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 15:22:47 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 133so1317499pgb.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 20:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eklVZby/+Hr8SSRgARkTvfHHPl42C69WPqA0+oyRXwo=;
 b=NjBRJIHn8heIKmVaT/agJp3jPvoP5nGqyGseBAvVRrsJZ8X1kZji+nRNOEu7nur+IB
 hyYpco65rwk/TnomGLQMpp//LIZgH7znaVinS3Ve2ZqBwBIOyqRHmU1VkXgX2/mENSx/
 piD9k38124Is03H+HFMlw+vVJH5G4+Pqu5mGIDBW1f9T42UajaK1YlvO11aJIzuTkY25
 Kk2iCIq6T95zxG99fMXr1SIPw6ydL5KyZPQDlaO8yiw5Sx0BKQmdlS0zkAlR0H+xwlA5
 aViyV6MfUXt1DbzOU0suY71idpfv1P9XmCF4EP2J5iIwzZryIhDjdtw6GyWgDPlyTTka
 Da+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eklVZby/+Hr8SSRgARkTvfHHPl42C69WPqA0+oyRXwo=;
 b=0w+juoGnLqVgltTH7rxs+JPeCrcr7qt9c1kHOJBlfkFeLvlQDXAg1qe1nB+1MLD449
 zxi7O1aiv6bjo3R1X2EXipmnZgO+Wz9uaPIzb5e/nioJ/sLiT9Ky75AIDQL/C53UOTl3
 A/20czBFK5jAM8ZhnYAbCQTqCaucPG0VPYMYJ9oGyN7NUOyXqNyELGCClJuBVE2lN73G
 7ZlFh0LCyCQoSML9e3drAZDCDmFD3KffANcISX9xsYLwAfTyZMz5YbaKul8iQ4qAyj7f
 dBNFz0PGqZD/u4Z6rl8qAPy9hQXXiY10Mafelvn6gQhVHNGc4BzyXnkYHC7Aqho4l+Za
 Ypmg==
X-Gm-Message-State: AOAM530q0sWSR6eqEjC7iyoNjl0S/VJ5qFgSckRuiiQotASb5V1INOIL
 gVUDzNFZyLkcnsmx9fZG70c=
X-Google-Smtp-Source: ABdhPJws6c1/XbS+JoLNRXnBNtysyD8ES0IdwkdFIP3tlP0c+ya6nqlxH0KsrpBAmo1D5md2gK3Vwg==
X-Received: by 2002:a05:6a00:1345:: with SMTP id
 k5mr32682190pfu.37.1643862164393; 
 Wed, 02 Feb 2022 20:22:44 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 20:22:43 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH 0/7] tools: Add by-name support
Date: Thu,  3 Feb 2022 14:51:27 +1030
Message-Id: <20220203042134.68425-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series introduces a command-line flag "--by-name" that means
"line-specifier arguments should be interpreted as names.

The patches implement the change for gpioset and gpioget tools. Once we
have settled on an implementation for those tools it could be extended
to other tools, such as gpiomon.

The test suite has been updated to cover the new option.

An initial discussion of the idea was presented here:

 http://lore.kernel.org/all/20211201072902.127542-1-joel@jms.id.au

Joel Stanley (7):
  tools: Clean up scandir memory allocations
  tools: Add line name to offset lookup helper
  tools: Add value support to line name lookup
  tools: gpioget: Add by-name support
  tools: gpioset: Add by-name support
  gpio-tools-test: Add gpioset --by-name tests
  gpio-tools-test: Add gpioget --by-name tests

 tools/gpio-tools-test.bats | 184 +++++++++++++++++++++++++++++++++++++
 tools/gpioget.c            |  57 ++++++++----
 tools/gpioset.c            |  68 ++++++++++----
 tools/tools-common.c       |  76 ++++++++++++++-
 tools/tools-common.h       |   4 +
 5 files changed, 352 insertions(+), 37 deletions(-)

-- 
2.34.1

