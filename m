Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9770C8A
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 00:27:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sx7T6VYlzDqX2
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 08:27:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tg4uPLcw"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sx6z6gRgzDqPg
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 08:27:07 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id t16so18024656pfe.11
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 15:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YjwjEgBtV+WIxMzS0qIWQAD+hhX5ge49pppqVj3tcjY=;
 b=tg4uPLcwCjQNixiEFCPSnsn1HYC87DUdpkJpyo/bXRQfq/aww/GgBtkiB8E7Qq1g5j
 Af7PV31RHuKOJDz3L1wkMnJFCnVkhFhJsFkDDruuSeISVUjwBWu77V2wvNONzo5z3uiE
 0psSv62s6sssUaiibLSdhab/xU2lU3TRosIuO4abyuKVAiPPuonzL3GRG99JUeQTWOQa
 AdboRvgQnQVOqQsl26sYnYm2iEdKvzaMEEntE89VVI5apLJ7r7MMGOzM2GwAH83WIUXu
 sWsH5VTNcidwXaCdoJApImc0oehS42FmixI/+XO/ngsiKthn8zhynVTatUdwtkVlNY+C
 mMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YjwjEgBtV+WIxMzS0qIWQAD+hhX5ge49pppqVj3tcjY=;
 b=tVy1t4aFkYKcAUEDGGvJsUjnVwRl3JKVUgO+x33dHw25YDoCGIakX6F1BUsbvIBRzJ
 jIIKtzv90dy/FHVhUyUH7zCru/LxWicx2zqXF13uLOHVPy5s9RCeBe1GT9uPprAB1nFd
 E/sU8FUVnDEKG9+IJsilyl6yFHIBBLpMexTBNtgxYOZEt8GNKvLBMViS37xUACG5qGtv
 8UuAyPY+79MtlQ+GGv9R4vfKzvzbdyAbDxA3ggzPgecRyl5fJbbQ1mlQQzHXU3KCRfOV
 uaAIvB3T0Lk9UQn5+PF5oSm0P1oiSEJX+djOtBSZrTsFBfifHz/horShuoNlMQ4q3uHG
 KuIw==
X-Gm-Message-State: APjAAAX0QYABNncyM4u7M7FteZGkcSJ+i43ghViQAb5EI3FbmQj7GQ1G
 jeUuYNZqKXCexpBelEOb2y7vWAQV8wjyxA9YlSlbMQ==
X-Google-Smtp-Source: APXvYqw3vS6i/EmRekjK1oNA5qJkfclmY+8xzyoZgLZTZhbKdKfMM1T7zktWSs1EUonU5FAnM7LqdzqRns8ijRW+qME=
X-Received: by 2002:aa7:9f1c:: with SMTP id g28mr2428401pfr.81.1563834424265; 
 Mon, 22 Jul 2019 15:27:04 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 22 Jul 2019 15:26:53 -0700
Message-ID: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
Subject: dbus-sensors + phosphor-hwmon
To: James Feist <james.feist@linux.intel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I haven't tested yet, but I have a device-tree with a lot of ~40
hard-coded sensors on it, and then the other sensors will be detected
with entity-manager (once that's set up).

In this case, will entity-manager populate the dbus configuration with
those in the device-tree initially making them available to
dbus-sensors? (or will we or should we, also configure phosphor-hwmon
for those sensors?)

Patrick
