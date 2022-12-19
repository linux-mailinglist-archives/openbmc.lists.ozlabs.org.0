Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6E650FF5
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 17:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbPlW5SWbz3c6Z
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 03:08:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nPtXWaZ4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nPtXWaZ4;
	dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbPkv6VJPz3bXL
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 03:08:23 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id e11-20020a4ab14b000000b0049be568062bso1469832ooo.4
        for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 08:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuyUVxYPp0VhF5K3OGtWJ/der+MwgYSTf3EdMOLDn9c=;
        b=nPtXWaZ4zppmPx1dRY+p7rV53k/Phqt6X0a+rWs+fRDNUx2t47Oqp2GiMYxF7OMY13
         3LQspU0qy+gmZd0y0vWaJW2+Bkhq6aZr13WOAVW2f+B/zJDdCsVsTrV/9OechaSKpgME
         lWaQhQsF8li0B41c6rxSlMBtpeleSjSvrDXdBHhoWGFm78WS/UkHBEj1rqjy94rv+SQj
         qbvxOPaweNYUPodsY6MSEW7GjWHOn+9IMCAPVzZwzO+zh4nVu7gaYYD8r//43j8WRusr
         uB1axfrcRsCSvh65GWerDXOAxGVkDZdHTPq1UT8u/F9348qAn3/a52J4g4q+/YN3Topa
         lpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuyUVxYPp0VhF5K3OGtWJ/der+MwgYSTf3EdMOLDn9c=;
        b=holWFnx5b8hRuTzPdier5NcwComc2sbkBlP/Y1NkToQX4/vFjzh9XcWjX+3PyLn4Rm
         NJ52ddSSSNhPd1hEYHdKDcp5uqWBeRWArdNd8WajdqPQOfHYeWppcFuTkAMKZlDtSWbm
         P+cj9G3ym3zhuh9OxVKByuSUSwHkOsz1yqXk0/k2ucfMp9MWrxJo3qH82FRE/lZ2nKRK
         jzux+7qK6/Zz+nRhcG/fU45bsDighW4k7s/1INCwuta0HXJaX2MklDMJCjYbJHQ4YWO1
         qNdKuN5K5RdgkyNEpPZv8jBMEjK5tTFO35v5Wds50IQnFxa7jKm4sAt1NQ/IfKpy1KFt
         kpHA==
X-Gm-Message-State: ANoB5pnEQ2YvZEaNHcGCSUpxZc2p3YxaYdGJeplJxYAvYYkA4MhhhLq6
	uuy0MfP4+XaWsyV4HTcIUEowQtSthFc=
X-Google-Smtp-Source: AA0mqf4/guGLVdvyTDgccLJtQ+HrqfjHZ7gvc/feiRr3w67Rz8XNBV9MhWPFU3MHvMxYlGrv0vWhNw==
X-Received: by 2002:a4a:d024:0:b0:4a3:c9f5:c1ab with SMTP id w4-20020a4ad024000000b004a3c9f5c1abmr15348683oor.6.1671466098173;
        Mon, 19 Dec 2022 08:08:18 -0800 (PST)
Received: from smtpclient.apple ([136.49.194.28])
        by smtp.gmail.com with ESMTPSA id m22-20020a4ae3d6000000b004a38ccf775fsm4057191oov.45.2022.12.19.08.08.17
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Dec 2022 08:08:17 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: OpenBMC gerrit and jenkins upgrades this Friday, Dec 23rd
Message-Id: <A6F7C213-DB01-4836-B5CC-0B154DBC0D85@gmail.com>
Date: Mon, 19 Dec 2022 10:08:17 -0600
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

I=E2=80=99m going to tentatively schedule a infrastructure update this =
Friday. I=E2=80=99m hoping to get it done 8am-12pm US central time.

I=E2=80=99ll grab the latest Jenkins LTS and update gerrit to 3.7.

Andrew=
