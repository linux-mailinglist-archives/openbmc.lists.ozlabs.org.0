Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE84B02D
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 04:34:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T8D202drzDqgq
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 12:34:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="W1gHWPcT"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T8BY1tWnzDqW4
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 12:33:09 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id x47so18054938qtk.11
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 19:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxvrNNSSXw613fKB8zXnOvbEpAMXTQ4k8FGe3ga46U0=;
 b=W1gHWPcTcslCUU0XXIFIO8zIleigl4zhKx16yF9mVNusgaws/lhUWLDoQv98f8b6Rw
 HxZocrlUzm4KdF54+rkY2tFUMus9JaT/pDiBJUwzldmHL0sUMmEOty3HGJ1VRBSheJzO
 2+vHaSVLztUA/3GxKXX42hSy71aZs22yS0WJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxvrNNSSXw613fKB8zXnOvbEpAMXTQ4k8FGe3ga46U0=;
 b=kJ28sEQ/nQ9XpAyxiDBo3NiOrEeFka6Oxd+mlaz+iDpHhAaH9ZpvcNZD/HSgqrvoAb
 3tLvdVwjshfO7IkqhwRU05hc/rOKn51d2a9TTprxwVzeFL1+/WB65o02+V7H5AVm41WS
 PBYV8v36MUWfrsHwGY0KMaY8L5J22eiPn6WugHGThyXN633iwJfQQ+OBAUjAKTijLBiP
 bRE+NZAVUhzUCSitBSy7+a0zZnzsCOjtdV5QZqhQxFJirwNF920S6zWjIw8syweIPZQC
 onS7rFrSrQK3S+Dd2BlOfCx0T2w6mJKjJclPz4Yk/zMVkTtLQ7QBiofMaKhYq7obHElx
 0uKA==
X-Gm-Message-State: APjAAAXTz/h9OlVqyfS8n8qyKwxOzlj3LMkuiFaJsMHNc2/oeyzzd4US
 kfeSGZXqPiJ+GSyoE7EfID0mVmkEVRYgvLzmRF+BaxB+
X-Google-Smtp-Source: APXvYqyEa0tPsJabDGn5cfCRZrIwmL7dDSYYtqZWfqth7rcbSBsNcVFGzpxpG8EuovOM50aaYTlVYYkudFjHZXGYhE8=
X-Received: by 2002:a0c:ae31:: with SMTP id y46mr31349951qvc.172.1560911585223; 
 Tue, 18 Jun 2019 19:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-3-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-3-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:32:54 +0000
Message-ID: <CACPK8XfVPtChQgdFxgg4N0A_Kt1oPGfCcbVmRxgSnDdXUAkKFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] phy: Include NC-SI in phy setup
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jun 2019 at 01:37, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> Add NC-SI to the usual phy handling. This makes two notable changes:
> - Somewhat similar to a fixed phy, phy_connect() will create an NC-SI
> phy if CONFIG_PHY_NCSI is defined.
> - An early return is added to phy_read() and phy_write() to handle a
> case like the NC-SI phy which does not define a bus.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
