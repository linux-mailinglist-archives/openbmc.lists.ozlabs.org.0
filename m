Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150F47A372
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 03:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHND91skCz2ynx
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 13:03:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHNCQ5W1Kz2ygB;
 Mon, 20 Dec 2021 13:02:56 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BK1uTvF075899;
 Mon, 20 Dec 2021 09:56:29 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 20 Dec 2021 10:01:47 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <eajames@linux.ibm.com>,
 <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/4] add aspeed-jpeg support for aspeed-video
Date: Mon, 20 Dec 2021 10:01:39 +0800
Message-ID: <20211220020143.1216-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BK1uTvF075899
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

The aim of this series is to add aspeed-jpeg support for aspeed-video
driver. aspeed-jpeg is a per-frame differential jpeg format which only
compress the parts which are different from the previous frame. In this
way, it reduces both the amount of data to be transferred by network and
those to be decoded on the client side.

In the last, debugfs information is also updated per this change.

Changes in v7:
 - Separate other patches alone from aspeed-jpeg series
 - for Aspeed-jpeg, generate an I frame every 8 frames
 - rename compression_mode as compression_scheme
 - Add more reference for aspeed-jpeg
 - Update debugfs message

Changes in v6:
 - Update description for new format, aspeed-jpeg, in Documentation.

Changes in v5:
 - Use model data to tell different soc

Changes in v4:
 - Add definition for the Aspeed JPEG format
 - Reserve controls for ASPEED
 - Use s_fmt to update format rather than new control
 - Update aspeed hq quality range, 1 ~ 12


Jammy Huang (4):
  media: v4l: Add definition for the Aspeed JPEG format
  media: v4l2-ctrls: Reserve controls for ASPEED
  media: aspeed: Support aspeed mode to reduce compressed data
  media: aspeed: Extend debug message

 .../media/uapi/v4l/pixfmt-reserved.rst        |  14 +
 drivers/media/platform/aspeed-video.c         | 287 ++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/aspeed-video.h             |  15 +
 include/uapi/linux/v4l2-controls.h            |   5 +
 include/uapi/linux/videodev2.h                |   1 +
 6 files changed, 304 insertions(+), 19 deletions(-)
 create mode 100644 include/uapi/linux/aspeed-video.h

-- 
2.25.1

