Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4C725D3
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:20:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thwS40NLzDqC3
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:20:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kijpEKhr"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQXW3M6KzDqPM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 03:32:26 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id b13so19494316pfo.1
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=K8nxF1UuiWS/X0ZDHKogaQOYinJe6eomu29Br/IO1ZU=;
 b=kijpEKhr28aiJUghFnxgPAGoj1BEoBdSYA3S3wIi7OerjwguVodfhp3v/bBNya9EbG
 0WkGf+asLmwUphgabDC+nFIJ2oJZPbQt3935H+UFozbG0/+14Y7Es2Wc/ALcGcaA4FXw
 hvFbOUkPsYoFiI5aYxylW1wLhvBKPkl6ybfj8JfDDwJBz3iscoo4zemu6XDtXR7aMDPa
 730SvvE64jiHDbyXS2Fk7aQOPnkRUGe+H4Qsk88Q7RDP+co75ougBTa4kuqIJO8wPVOs
 QiBAEG1QYdpwKgLrRPfrE9360khV9ehXcmqxrkB9stDYCnApGdnpJHQQ6ve8PdXYHPK2
 vaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=K8nxF1UuiWS/X0ZDHKogaQOYinJe6eomu29Br/IO1ZU=;
 b=YN8jVoY7/+KoTq0yFGPBD46ECIAcitmJHfcLXUJ0xOsriQWLS/W70iEK2U9VdzC3um
 xFqsd06HbDBTbVPO4h5V8QAWXoSeD1cG7e9vkxCoIggNptLnK1FYQ7OLWRUC/ntdClHG
 hjiazHJ8AWKMxFQE76/CNySwVp+n62Tqiq6jM0CXTSVTYfEZjo1ZPDKbQbpIx1inrDMb
 MkrhZkakKuzWeD51R9s6DDg2uNp+8/G43Wlt1HWAfcL+cJEmIda/OH+KIow7VWeUGjEn
 UWuw9H37HP+jm1F6wa25K8wJYCC3wdttGQ7x0Gdb/3nr6F1D03BI36i/a3WpTGAkjwPw
 Pa3w==
X-Gm-Message-State: APjAAAWOly+5/mZXEEmQNuma/lMlulnmo6iCAdxgbpp8j8L3olqRhjSe
 954NxL5Oee3BMD4Y1XUiLZFjnsZdhnD6NAppfe6Ul5ihZuY=
X-Google-Smtp-Source: APXvYqyIH1Q8KzgSPfa1mfznAqjgggAtTHMfhM/uMRaXmXYaFqVSnPakvDJxGB+VsjxqbmtWeG5N7ilxi3GTVMnPpFY=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr6887386pfi.136.1563903142951; 
 Tue, 23 Jul 2019 10:32:22 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 23 Jul 2019 10:32:12 -0700
Message-ID: <CAO=notwuD2FJ2w1P2v29U1f98T6_D=rbPrmoW3_DD157PciWSw@mail.gmail.com>
Subject: gerrit not syncing to github
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

I wanted to reach out and see if anyone else has experienced this,
openbmc/phosphor-ipmi-flash stopped syncing from gerrit.  I know
gerrit was recently updated, so I'm curious if this is a problem only
experienced in this one repo or something in general?

Patrick
